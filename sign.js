const fs = require('fs');
const path = require('path');
const signPDF = require('jsignpdf').default;
const forge = require('node-forge');

// Funzione ricorsiva per cercare tutti i file PDF non firmati nelle sottocartelle
function getAllPDFs(dir) {
  let results = [];
  console.log(`DEBUG: Reading directory: ${dir}`);
  try {
    const list = fs.readdirSync(dir);
    list.forEach(file => {
      const filePath = path.join(dir, file);
      try {
        const stat = fs.statSync(filePath);
        if (stat.isDirectory()) {
          console.log(`DEBUG: ${filePath} è una directory. Eseguo la ricerca ricorsiva...`);
          results = results.concat(getAllPDFs(filePath));
        } else if (file.toLowerCase().endsWith('.pdf') && !file.toLowerCase().endsWith('_signed.pdf')) {
          console.log(`DEBUG: Trovato file PDF: ${filePath}`);
          results.push(filePath);
        }
      } catch (err) {
        console.error(`DEBUG: Errore nello stat di ${filePath}:`, err);
      }
    });
  } catch (err) {
    console.error(`DEBUG: Errore nella lettura della directory ${dir}:`, err);
  }
  return results;
}

async function signFiles() {
  const pdfDir = path.join(__dirname, 'documents');
  console.log(`DEBUG: PDF directory: ${pdfDir}`);
  
  const files = getAllPDFs(pdfDir);
  console.log(`DEBUG: Trovati ${files.length} file PDF da firmare.`);
  
  if (files.length === 0) {
    console.log("DEBUG: Nessun file PDF da firmare trovato.");
    return;
  }
  
  // Percorso del certificato
  const certPath = path.join(__dirname, 'certificate.p12');
  console.log(`DEBUG: Percorso del certificato: ${certPath}`);
  
  let certBuffer;
  try {
    certBuffer = fs.readFileSync(certPath);
    console.log(`DEBUG: Certificato caricato, lunghezza buffer: ${certBuffer.length} bytes`);
  } catch (err) {
    console.error(`DEBUG: Errore nel leggere il file certificato ${certPath}:`, err);
    process.exit(1);
  }
  
  const passphrase = process.env.SIGN_CERT_PASSWORD;
  if (!passphrase) {
    console.error("DEBUG: La variabile d'ambiente SIGN_CERT_PASSWORD non è impostata.");
    process.exit(1);
  }
  
  // Estrai alcuni dati dal certificato con node-forge
  try {
    const binaryStr = certBuffer.toString('binary');
    const p12Asn1 = forge.asn1.fromDer(binaryStr);
    const p12 = forge.pkcs12.pkcs12FromAsn1(p12Asn1, false, passphrase);
    const bags = p12.getBags({ bagType: forge.pki.oids.certBag });
    const certObj = bags[forge.pki.oids.certBag][0].cert;
    console.log("DEBUG: Certificate Subject Attributes:", certObj.subject.attributes);
  } catch (err) {
    console.error("DEBUG: Errore nell'estrazione dei dati dal certificato:", err);
  }
  
  // Firma ogni file PDF
  for (const filePath of files) {
    console.log(`DEBUG: Elaborazione file: ${filePath}`);
    
    let pdfBuffer;
    try {
      pdfBuffer = fs.readFileSync(filePath);
      console.log(`DEBUG: File letto, dimensione: ${pdfBuffer.length} bytes`);
    } catch (err) {
      console.error(`DEBUG: Errore nella lettura del file ${filePath}:`, err);
      continue;
    }
    
    try {
      console.log("DEBUG: Inizio processo di firma...");
      const options = { tsa: 'http://timestamp.digicert.com' };
      const signedBuffer = await signPDF(pdfBuffer, certBuffer, passphrase, options);
      console.log(`DEBUG: Firma completata, dimensione file firmato: ${signedBuffer.length} bytes`);
      
      const signedFilePath = filePath.replace('.pdf', '_signed.pdf');
      fs.writeFileSync(signedFilePath, signedBuffer);
      console.log(`DEBUG: File firmato salvato: ${signedFilePath}`);
      
      fs.unlinkSync(filePath);
      console.log(`DEBUG: File originale rimosso: ${filePath}`);
    } catch (err) {
      console.error(`DEBUG: Errore durante la firma del file ${filePath}:`, err);
      process.exit(1);
    }
  }
  
  console.log("DEBUG: Processo di firma completato per tutti i file.");
}

signFiles();

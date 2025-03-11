const signPDF = require('jsignpdf').default;
const fs = require('fs');
const path = require('path');
const { PDFDocument, rgb } = require('pdf-lib');

// Funzione per cercare ricorsivamente tutti i PDF (non firmati) nella cartella documents
function getAllPDFs(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      results = results.concat(getAllPDFs(filePath));
    } else if (file.toLowerCase().endsWith('.pdf') && !file.toLowerCase().endsWith('_signed.pdf')) {
      results.push(filePath);
    }
  });
  return results;
}

// Funzione per aggiungere firma visibile con logo, data e ora sull'ultima pagina
async function addVisibleSignature(signedFilePath, signerName, logoPath) {
  const pdfBytes = fs.readFileSync(signedFilePath);
  const pdfDoc = await PDFDocument.load(pdfBytes);
  const pages = pdfDoc.getPages();
  const lastPage = pages[pages.length - 1]; // Usa l'ultima pagina

  // Carica il logo se esiste
  let logoImage;
  if (fs.existsSync(logoPath)) {
    const logoBytes = fs.readFileSync(logoPath);
    try {
      logoImage = await pdfDoc.embedPng(logoBytes);
    } catch {
      logoImage = await pdfDoc.embedJpg(logoBytes);
    }
  }

  // Calcola il posizionamento in basso a sinistra
  const x = 20;       // margine sinistro
  const y = 20;       // margine inferiore
  const width = 250;  // larghezza del blocco firma
  const height = 80;  // altezza del blocco firma

  // Testo della firma con data e ora
  const text = `Firmato da: ${signerName}\nData: ${new Date().toLocaleString()}`;

  // Aggiungi un rettangolo bianco di sfondo per la firma
  lastPage.drawRectangle({
    x, y,
    width, height,
    color: rgb(1, 1, 1),
    opacity: 0.8,
  });

  // Se il logo è presente, aggiungilo ingrandito
  if (logoImage) {
    lastPage.drawImage(logoImage, {
      x: x + 5,
      y: y + 5,
      width: 80,   // logo ingrandito
      height: 80,
    });
  }

  // Aggiungi il testo della firma, posizionato a destra del logo
  lastPage.drawText(text, {
    x: x + 90,
    y: y + height - 20, // posizione verticale regolata
    size: 10,
    color: rgb(0, 0, 0),
  });

  const modifiedPdfBytes = await pdfDoc.save();
  fs.writeFileSync(signedFilePath, modifiedPdfBytes);
  console.log(`DEBUG: Firma visibile aggiunta a ${signedFilePath}`);
}

async function signFiles() {
  const pdfDir = path.join(__dirname, 'documents');
  const files = getAllPDFs(pdfDir);
  console.log(`DEBUG: Trovati ${files.length} PDF da firmare.`);

  if (files.length === 0) {
    console.log("DEBUG: Nessun file PDF da firmare trovato.");
    return;
  }

  // Carica il certificato PKCS#12
  const certPath = path.join(__dirname, 'certificate.p12');
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
    console.error("DEBUG: La variabile SIGN_CERT_PASSWORD non è impostata.");
    process.exit(1);
  }

  for (const filePath of files) {
    console.log(`DEBUG: Elaborazione file: ${filePath}`);
    try {
      const pdfBuffer = fs.readFileSync(filePath);
      console.log(`DEBUG: Lettura completata, dimensione: ${pdfBuffer.length} bytes`);
      
      const options = { tsa: 'http://timestamp.digicert.com' };
      const signedBuffer = await signPDF(pdfBuffer, certBuffer, passphrase, options);
      console.log(`DEBUG: Firma completata, dimensione file firmato: ${signedBuffer.length} bytes`);

      const signedFilePath = filePath.replace('.pdf', '_signed.pdf');
      fs.writeFileSync(signedFilePath, signedBuffer);
      console.log(`DEBUG: File firmato salvato: ${signedFilePath}`);
      
      fs.unlinkSync(filePath);
      console.log(`DEBUG: File originale rimosso: ${filePath}`);

      // Aggiungi la firma visibile con logo, data e ora
      const logoPath = path.join(__dirname, 'logo.png');
      await addVisibleSignature(signedFilePath, "Tuo Nome", logoPath);
    } catch (err) {
      console.error(`DEBUG: Errore durante la firma del file ${filePath}:`, err);
      process.exit(1);
    }
  }

  console.log("DEBUG: Processo di firma completato per tutti i file.");
}

signFiles();

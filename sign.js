const signPDF = require('jsignpdf').default;
const fs = require('fs');
const path = require('path');
const { PDFDocument, rgb } = require('pdf-lib');

// analizza cartelle per pdf, funzione ricorsiva
function getAllPDFs(dir) {
  let results = [];
  const list = fs.readdirSync(dir);

  list.forEach(file => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);

    if (stat && stat.isDirectory()) {
      results = results.concat(getAllPDFs(filePath)); // Ricorsione nelle sottocartelle
    } else if (file.endsWith('.pdf') && !file.endsWith('_signed.pdf')) {
      results.push(filePath);
    }
  });

  return results;
}

//  aggiungo la firma visibile con logo e data
async function addVisibleSignature(pdfPath, signedPath, signerName, logoPath) {
  const pdfBytes = fs.readFileSync(signedPath);
  const pdfDoc = await PDFDocument.load(pdfBytes);
  const pages = pdfDoc.getPages();
  const firstPage = pages[0]; // Firma sulla prima pagina

  
  let logoImage;
  if (fs.existsSync(logoPath)) {
    const logoBytes = fs.readFileSync(logoPath);
    logoImage = await pdfDoc.embedPng(logoBytes);
  }

  // Dimensioni della firma
  const width = 200; // Larghezza del box firma
  const height = 80; // Altezza del box firma
  const x = firstPage.getWidth() - width - 20; // Posizione in basso a destra
  const y = 20; // Altezza da fondo pagina

  // Testo della firma
  const text = `Firmato digitalmente da:\n${signerName}\nData: ${new Date().toLocaleString()}`;

  // box firma
  firstPage.drawRectangle({
    x, y,
    width, height,
    color: rgb(1, 1, 1),
    opacity: 0.8,
  });

  // Aggiung0 il logo dx doc
  if (logoImage) {
    firstPage.drawImage(logoImage, {
      x: x + 5,
      y: y + 10,
      width: 50,
      height: 50,
    });
  }

  // Aggiung0 il testo della firma dx documento
  firstPage.drawText(text, {
    x: x + 60,
    y: y + 40,
    size: 10,
    color: rgb(0, 0, 0), // Testo nero
  });

  const modifiedPdfBytes = await pdfDoc.save();
  fs.writeFileSync(signedPath, modifiedPdfBytes);
  console.log(`DEBUG: Firma visibile con logo aggiunta a ${signedPath}`);
}

async function signFiles() {
  const pdfDir = path.join(__dirname, 'documents');
  const files = getAllPDFs(pdfDir);

  console.log(`DEBUG: Trovati ${files.length} PDF da firmare.`);

  if (files.length === 0) {
    console.log("DEBUG: Nessun file PDF da firmare trovato.");
    return;
  }

  // Pcarico logo per firma
  const logoPath = path.join(__dirname, 'AlphaCodeLogo.png'); 

  // Carico il certificato PKCS#12 contenuto nelle variabili segrete di github
  const certBuffer = fs.readFileSync(path.join(__dirname, 'certificate.p12'));
  const passphrase = process.env.SIGN_CERT_PASSWORD;

  console.log(`DEBUG: Certificato caricato, lunghezza buffer: ${certBuffer.length} bytes`);

  for (const filePath of files) {
    console.log(`DEBUG: Elaborazione file: ${filePath}`);

    try {
      const pdfBuffer = fs.readFileSync(filePath);
      console.log(`DEBUG: Lettura completata, dimensione: ${pdfBuffer.length} bytes`);

      
      const options = { tsa: 'http://timestamp.digicert.com' };

      // Firmo il PDF
      const signedBuffer = await signPDF(pdfBuffer, certBuffer, passphrase, options);
      console.log(`DEBUG: Firma completata, dimensione file firmato: ${signedBuffer.length} bytes`);

      // Salvo il file firmato con suffisso "_signed.pdf"
      const signedFilePath = filePath.replace('.pdf', '_signed.pdf');
      fs.writeFileSync(signedFilePath, signedBuffer);
      console.log(`DEBUG: File firmato salvato: ${signedFilePath}`);

      // Rimuovo il file originale
      fs.unlinkSync(filePath);
      console.log(`DEBUG: File originale rimosso: ${filePath}`);

      // Aggiungo la firma visibile con il logo
      await addVisibleSignature(filePath, signedFilePath, "AlphaCode", logoPath);
    } catch (err) {
      console.error(`DEBUG: Errore durante la firma del file ${filePath}:`, err);
      process.exit(1);
    }
  }

  console.log("DEBUG: Processo di firma completato per tutti i file.");
}

signFiles();

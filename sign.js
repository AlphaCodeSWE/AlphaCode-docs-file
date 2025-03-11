const signPDF = require('jsignpdf').default;
const fs = require('fs');
const path = require('path');
const { PDFDocument, rgb } = require('pdf-lib');


function formatDate(date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0');
  const day = String(date.getDate()).padStart(2, '0');
  const hours = String(date.getHours()).padStart(2, '0');
  const minutes = String(date.getMinutes()).padStart(2, '0');
  const seconds = String(date.getSeconds()).padStart(2, '0');

  // Calcola l'offset di fuso orario in minuti
  const offsetMinutes = date.getTimezoneOffset() * -1; // invertito per ottenere +/-
  const sign = offsetMinutes >= 0 ? '+' : '-';
  const absOffset = Math.abs(offsetMinutes);
  const offsetH = String(Math.floor(absOffset / 60)).padStart(2, '0');
  const offsetM = String(absOffset % 60).padStart(2, '0');

  // Costruisce la stringa offset in stile +01'00
  const offsetString = `${sign}${offsetH}'${offsetM}`;

  return `${year}.${month}.${day} ${hours}:${minutes}:${seconds} ${offsetString}`;
}


function getAllPDFs(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach((file) => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      results = results.concat(getAllPDFs(filePath));
    } else if (
      file.toLowerCase().endsWith('.pdf') &&
      !file.toLowerCase().endsWith('_signed.pdf')
    ) {
      results.push(filePath);
    }
  });
  return results;
}


async function addVisibleSignature(signedFilePath, signerName) {
  const pdfBytes = fs.readFileSync(signedFilePath);
  const pdfDoc = await PDFDocument.load(pdfBytes);
  const pages = pdfDoc.getPages();
  const lastPage = pages[pages.length - 1]; // ultima pagina

  // Dimensioni della pagina
  const pageWidth = lastPage.getWidth();

  // Dimensioni e posizione del riquadro firma
  const boxWidth = 300;
  const boxHeight = 60;
  const margin = 20;
  const x = pageWidth - boxWidth - margin; // posiziona a destra
  const y = margin;                        // posiziona in basso

  // Rettangolo di sfondo 
  lastPage.drawRectangle({
    x,
    y,
    width: boxWidth,
    height: boxHeight,
    color: rgb(1, 1, 1),
    opacity: 0.8,
  });

  // Prima riga: "Firmato digitalmente da [NOME]"
  const fontSize = 14;
  lastPage.drawText(`Firmato digitalmente da ${signerName}`, {
    x: x + 10,
    y: y + boxHeight - (fontSize + 5), // qualche pixel sotto il top del riquadro
    size: fontSize,
    color: rgb(0, 0, 0),
  });

  // Seconda riga: "Data: YYYY.MM.DD HH:mm:ss +hh'mm"
  const dateStr = formatDate(new Date());
  lastPage.drawText(`Data: ${dateStr}`, {
    x: x + 10,
    y: y + 10, // qualche pixel sopra il bordo inferiore
    size: fontSize,
    color: rgb(0, 0, 0),
  });

  // Salva il PDF modificato
  const modifiedPdfBytes = await pdfDoc.save();
  fs.writeFileSync(signedFilePath, modifiedPdfBytes);
  console.log(`DEBUG: Firma visibile aggiunta a ${signedFilePath}`);
}


async function signFiles() {
  const pdfDir = path.join(__dirname, 'documents');
  const files = getAllPDFs(pdfDir);
  console.log(`DEBUG: Trovati ${files.length} PDF da firmare.`);

  if (files.length === 0) {
    console.log('DEBUG: Nessun file PDF da firmare trovato.');
    return;
  }

  // Carica il certificato PKCS#12
  const certPath = path.join(__dirname, 'certificate.p12');
  let certBuffer;
  try {
    certBuffer = fs.readFileSync(certPath);
    console.log(
      `DEBUG: Certificato caricato, lunghezza buffer: ${certBuffer.length} bytes`
    );
  } catch (err) {
    console.error(`DEBUG: Errore nel leggere il file certificato ${certPath}:`, err);
    process.exit(1);
  }

  // Recupera la passphrase da variabile d'ambiente
  const passphrase = process.env.SIGN_CERT_PASSWORD;
  if (!passphrase) {
    console.error('DEBUG: La variabile SIGN_CERT_PASSWORD non è impostata.');
    process.exit(1);
  }

  // Itera su tutti i PDF trovati
  for (const filePath of files) {
    console.log(`DEBUG: Elaborazione file: ${filePath}`);
    try {
      const pdfBuffer = fs.readFileSync(filePath);
      console.log(
        `DEBUG: Lettura completata, dimensione: ${pdfBuffer.length} bytes`
      );

      // Firma digitale con TSA
      const options = { tsa: 'http://timestamp.digicert.com' };
      const signedBuffer = await signPDF(pdfBuffer, certBuffer, passphrase, options);
      console.log(
        `DEBUG: Firma completata, dimensione file firmato: ${signedBuffer.length} bytes`
      );

      // Salvataggio con suffisso _signed.pdf
      const signedFilePath = filePath.replace('.pdf', '_signed.pdf');
      fs.writeFileSync(signedFilePath, signedBuffer);
      console.log(`DEBUG: File firmato salvato: ${signedFilePath}`);

      // Elimina il file originale
      fs.unlinkSync(filePath);
      console.log(`DEBUG: File originale rimosso: ${filePath}`);

      // Aggiungo la firma visibile
      await addVisibleSignature(signedFilePath, 'AlphaCode®');
    } catch (err) {
      console.error(`DEBUG: Errore durante la firma del file ${filePath}:`, err);
      process.exit(1);
    }
  }

  console.log('DEBUG: Processo di firma completato per tutti i file.');
}

// Avvio del processo di firma
signFiles();

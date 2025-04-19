// sign.js
import fs from 'fs';
import path from 'path';
import { plainAddPlaceholder, sign } from 'node-signpdf';
import { PDFDocument, rgb } from 'pdf-lib';

// Ricerca ricorsiva dei PDF non firmati
function getAllPDFs(dir) {
  let results = [];
  for (const name of fs.readdirSync(dir)) {
    const filePath = path.join(dir, name);
    if (fs.statSync(filePath).isDirectory()) {
      results = results.concat(getAllPDFs(filePath));
    } else if (name.toLowerCase().endsWith('.pdf') && !name.toLowerCase().endsWith('_signed.pdf')) {
      results.push(filePath);
    }
  }
  return results;
}

// Formatta timestamp
function formatTimestamp(d) {
  const pad = n => ('0'+n).slice(-2);
  return `${d.getFullYear()}-${pad(d.getMonth()+1)}-${pad(d.getDate())}: ${pad(d.getHours())}:${pad(d.getMinutes())}:${pad(d.getSeconds())}`;
}

// Aggiunge firma visibile con pdf-lib
async function addVisibleSignature(file, signerName, logoPath) {
  const bytes = fs.readFileSync(file);
  const pdfDoc = await PDFDocument.load(bytes);
  const pages = pdfDoc.getPages();
  const last = pages[pages.length-1];
  const { width, height } = last.getSize();
  const boxW = 250, boxH = 80, margin=20;
  const x = width - boxW - margin, y = margin;
  let logoImg;
  if (fs.existsSync(logoPath)) {
    const logoBytes = fs.readFileSync(logoPath);
    logoImg = await pdfDoc.embedPng(logoBytes).catch(() => pdfDoc.embedJpg(logoBytes));
  }
  const ts = formatTimestamp(new Date());
  const text = `Firmato da: ${signerName}\nData: ${ts}`;
  if (logoImg) {
    last.drawImage(logoImg, { x: x+5, y: y+5, width: 80, height: 90 });
  }
  last.drawText(text, { x: x+90, y: y+boxH-20, size: 10, color: rgb(0,0,0) });
  fs.writeFileSync(file, await pdfDoc.save());
  console.log(`DEBUG: Firma visibile aggiunta a ${file}`);
}

async function signFiles() {
  const pdfDir = path.join(__dirname, 'documents');
  const files = getAllPDFs(pdfDir);
  console.log(`DEBUG: Trovati ${files.length} PDF da firmare.`);
  if (!files.length) return;

  const p12 = fs.readFileSync(path.join(__dirname,'certificate.p12'));
  const pass = process.env.SIGN_CERT_PASSWORD;
  if (!pass) { console.error("Manca SIGN_CERT_PASSWORD"); process.exit(1); }

  for (const f of files) {
    console.log(`DEBUG: Elaborazione ${f}`);
    const pdf = fs.readFileSync(f);
    // Inserisce placeholder di dimensione adeguata
    const placeholderPdf = plainAddPlaceholder({
      pdfBuffer: pdf,
      reason: 'Firma digitale AlphaCode',
      signatureLength: 8192
    });
    // Firma il PDF
    const signedPdf = sign(placeholderPdf, p12, { passphrase: pass });
    const signedPath = f.replace('.pdf', '_signed.pdf');
    fs.writeFileSync(signedPath, signedPdf);
    console.log(`DEBUG: Salvato firmato: ${signedPath}`);
    fs.unlinkSync(f);
    // Aggiungi la firma visibile
    await addVisibleSignature(signedPath, 'AlphaCode®', path.join(__dirname,'logo.png'));
  }
  console.log("DEBUG: Firma completata per tutti i file.");
}

signFiles().catch(e => {
  console.error("Errore in sign.js:", e);
  process.exit(1);
});

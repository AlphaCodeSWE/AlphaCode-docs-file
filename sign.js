// sign.js (CommonJS)

const fs = require('fs');
const path = require('path');

// 1) Import del signer come default export
const signer = require('node-signpdf').default; // ora signer.sign è disponibile :contentReference[oaicite:0]{index=0}

// 2) Import del plain placeholder dai dist/helpers
const { plainAddPlaceholder } = require('node-signpdf/dist/helpers'); // :contentReference[oaicite:1]{index=1}

const { PDFDocument, rgb } = require('pdf-lib');

// Cerca ricorsivamente i PDF non ancora firmati
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
  const pad = n => ('0' + n).slice(-2);
  return `${d.getFullYear()}-${pad(d.getMonth()+1)}-${pad(d.getDate())}: ${pad(d.getHours())}:${pad(d.getMinutes())}:${pad(d.getSeconds())}`;
}

// Aggiunge firma visibile con pdf-lib
async function addVisibleSignature(file, signerName, logoPath) {
  const bytes = fs.readFileSync(file);
  const pdfDoc = await PDFDocument.load(bytes);
  const pages = pdfDoc.getPages();
  const last = pages[pages.length - 1];
  const { width, height } = last.getSize();
  const boxW = 250, boxH = 80, margin = 20;
  const x = width - boxW - margin, y = margin;

  let logoImg;
  if (fs.existsSync(logoPath)) {
    const logoBytes = fs.readFileSync(logoPath);
    logoImg = await pdfDoc.embedPng(logoBytes).catch(() => pdfDoc.embedJpg(logoBytes));
  }

  const ts = formatTimestamp(new Date());
  const text = `Firmato da: ${signerName}\nData: ${ts}`;

  if (logoImg) {
    last.drawImage(logoImg, { x: x + 5, y: y + 5, width: 80, height: 90 });
  }
  last.drawText(text, { x: x + 90, y: y + boxH - 20, size: 10, color: rgb(0, 0, 0) });

  fs.writeFileSync(file, await pdfDoc.save());
  console.log(`DEBUG: Firma visibile aggiunta a ${file}`);
}

// Main
async function signFiles() {
  const pdfDir = path.join(__dirname, 'documents');
  const files = getAllPDFs(pdfDir);
  console.log(`DEBUG: Trovati ${files.length} PDF da firmare.`);
  if (files.length === 0) return;

  const p12 = fs.readFileSync(path.join(__dirname, 'certificate.p12'));
  const pass = process.env.SIGN_CERT_PASSWORD;
  if (!pass) {
    console.error("DEBUG: SIGN_CERT_PASSWORD non impostata");
    process.exit(1);
  }

  for (const f of files) {
    console.log(`DEBUG: Elaborazione ${f}`);
    const pdfBuffer = fs.readFileSync(f);

    // 3) Inserisce placeholder
    const placeholderPdf = plainAddPlaceholder({ pdfBuffer });

    // 4) Firma col metodo sign() del default export
    const signedPdf = signer.sign(placeholderPdf, p12, { passphrase: pass });

    // Salva e sostituisci
    const signedPath = f.replace('.pdf', '_signed.pdf');
    fs.writeFileSync(signedPath, signedPdf);
    console.log(`DEBUG: Salvato firmato: ${signedPath}`);

    // Rimuove l’originale e aggiunge firma visibile
    fs.unlinkSync(f);
    await addVisibleSignature(signedPath, 'AlphaCode®', path.join(__dirname, 'logo.png'));
  }

  console.log("DEBUG: Processo di firma completato.");
}

signFiles().catch(err => {
  console.error("Errore in sign.js:", err);
  process.exit(1);
});

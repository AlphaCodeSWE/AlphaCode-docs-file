// File: sources/candidatura/LetteraPresentazione.typ

// Importa il template principale (assicurati che il percorso sia corretto rispetto alla posizione del file)
#import "../main.typ": main

// Definizione del contenuto della lettera di presentazione
let lettera = "
Gentile Responsabile,

mi chiamo Mario Rossi e sono entusiasta di candidarmi per il ruolo di Sviluppatore Software nella vostra azienda. 
Nel corso della mia esperienza professionale ho maturato competenze nel campo della programmazione, 
del problem solving e del lavoro in team, che ritengo possano contribuire al successo del vostro team.

Ringraziandovi per l'attenzione, resto a disposizione per un colloquio conoscitivo.

Cordiali saluti,
Mario Rossi
"

// Richiama il template principale, passando il contenuto della lettera come parametro
main(lettera)

name: archive

on:
  workflow_run:
    workflows: ["Build Typst Documentation"]
    types: [completed]
  workflow_dispatch:

permissions:
  contents: write

jobs:
  archive_only:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        with:
          persist-credentials: true

      - name: Pull latest changes
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git pull --rebase origin main

      - name: Generate sign_report.yml
        run: |
          echo "signed_files:" > sign_report.yml
          SIGNED_FILES=$(find documents -type f -name "*_signed.pdf")
          for pdf in $SIGNED_FILES; do
            echo "- $pdf" >> sign_report.yml
          done
          echo "DEBUG: Creato sign_report.yml:"
          cat sign_report.yml

      - name: Run archiving bot
        run: |
          echo "Avvio del bot di archiviazione..."
          python process_files.py sign_report.yml
          echo "Bot completato."

      - name: Commit and push archivio
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add documents/archive sign_report.yml final_report.yml || true
          if git diff --cached --quiet; then
            echo "DEBUG: No changes to commit for archivio"
            exit 0
          fi
          git commit -m "Archivia vecchie versioni PDF (bot)"
          git push origin HEAD:main

      - name: List documents/archive
        run: ls -R documents/archive || true

      - name: Upload final report
        uses: actions/upload-artifact@v4
        with:
          name: final-report
          path: final_report.yml
          if-no-files-found: ignore

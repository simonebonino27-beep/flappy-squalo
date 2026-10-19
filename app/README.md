# App Android di Flappy Squalo

Questa cartella trasforma il gioco in un'app Android (Capacitor). Non serve installare niente:
GitHub costruisce l'app da solo ad ogni aggiornamento (scheda **Actions** → "App Android" → artefatti).

- `game.html` – il gioco (versione Play Store, viene aggiornato automaticamente)
- `prepare-www.sh` – prepara i file per l'app
- `.github/workflows/android.yml` – la "fabbrica" che crea `.aab` (Play Store) e `.apk` (prova sul telefono)

Segreti da impostare su GitHub (Settings → Secrets and variables → Actions):
- `KEYSTORE_B64`, `KEYSTORE_PASS` – chiave di firma (senza, l'app esce solo in versione di prova)
- `ADMOB_APP_ID`, `ADMOB_REWARDED_ID` – ID AdMob veri (senza, usa gli annunci di test di Google)

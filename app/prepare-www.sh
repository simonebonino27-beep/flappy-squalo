#!/bin/bash
# Prepara la cartella www dell'app partendo dal gioco (game.html) senza dipendere da internet per three.js
set -e
cd "$(dirname "$0")"
rm -rf www && mkdir -p www
cp node_modules/three/build/three.min.js www/three.min.js
cp node_modules/@capacitor/core/dist/capacitor.js www/capacitor.js
sed -e 's#https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js#three.min.js#' game.html > www/body.html
{
  echo '<!doctype html><html lang="it"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,viewport-fit=cover,user-scalable=no"><meta name="theme-color" content="#020b12"><title>Flappy Squalo</title><style>[hidden]{display:none!important}html,body{margin:0;height:100%;background:#020b12}</style><script src="capacitor.js"></script></head><body>'
  cat www/body.html
  echo '</body></html>'
} > www/index.html
rm www/body.html
if [ -n "$ADMOB_REWARDED_ID" ]; then sed -i "s#ca-app-pub-3940256099942544/5224354917#$ADMOB_REWARDED_ID#" www/index.html; fi
echo "www pronta: $(du -sh www | cut -f1)"

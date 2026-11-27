#!/bin/sh
# Stamp the CSS and JS links in index.html with a short hash of each file's
# contents, so browsers fetch the new file as soon as it changes.
cd "$(dirname "$0")/.." || exit 1
for f in css/style.css js/main.js; do
  h=$(shasum "$f" | cut -c1-8)
  perl -pi -e "s{\Q$f\E(\?v=[0-9a-f]+)?\"}{$f?v=$h\"}g" index.html
done

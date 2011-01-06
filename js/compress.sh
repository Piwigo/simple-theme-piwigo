#!/bin/sh
# combine and minify scripts

rm scripts.js scripts.min.js
cat simplescripts.js pwgscripts.js rating.js jquery.cookie.min.js > scripts.js
yuicompressor --nomunge --type js scripts.js > scripts.min.js

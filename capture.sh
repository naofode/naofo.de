!#/bin/bash
wkhtmltoimage --width 1280 $1 $2
convert $2 -trim png8:$2-trimmed
mv $2-trimmed $2

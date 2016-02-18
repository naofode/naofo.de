#!/bin/bash
## Adicionado xvfb-run conforme sugestões em https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2037#issuecomment-62019521 e https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=580226#34
xvfb-run wkhtmltoimage --disable-javascript --crop-h 13000 --crop-w 10000 --width 1280 $1 $2
rc=$?; if [[ $rc != 0 ]]; then
	xvfb-run wkhtmltoimage --disable-javascript --crop-h 13000 --crop-w 10000 --width 1280 --height 10000 $1 $2
fi
echo "success"

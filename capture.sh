#!/bin/bash
wkhtmltoimage --disable-javascript --crop-h 13000 --crop-w 10000 --width 1280 $1 $2
rc=$?; if [[ $rc != 0 ]]; then
	wkhtmltoimage --disable-javascript --crop-h 13000 --crop-w 10000 --width 1280 --height 10000 $1 $2
fi
echo "success"

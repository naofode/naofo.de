#!/bin/bash
wkhtmltoimage --disable-javascript --crop-h 14000 --width 1280 $1 $2
echo "success"

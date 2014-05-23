!#/bin/bash
wkhtmltoimage --width 1280 "$1" $2 > /dev/null
if [ $? -ne 0 ]; then
    wkhtmltoimage --disable-javascript --load-error-handling ignore --disable-plugins --width 1280 "$1?&retry" $2 > /dev/null
    if [ $? -ne 0 ]; then
	echo "error"
	exit
    fi
fi
convert $2 -trim png8:$2-trimmed > /dev/null
mv $2-trimmed $2
echo "success"

#!/bin/bash
min_size=1024
max_size=52428800
wkhtmltoimage --crop-h 14000 --width 1280 $1 $2
file_size=$(stat -c%s $2)
if [[ ( $file_size -lt $min_size ) ]]; then
    wkhtmltoimage --crop-h 14000 --custom-header 'User-Agent' 'Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30' --custom-header-propagation --enable-javascript --javascript-delay 1500 --no-stop-slow-scripts --debug-javascript --load-error-handling ignore --width 1280 "$1?&retry" $2
    file_size=$(stat -c%s $2)
    if [[ ( $file_size -lt $min_size ) ]]; then
    	rm $2
		echo "error"
		exit
    fi
fi
convert $2 -trim png8:$2-trimmed > /dev/null
mv $2-trimmed $2
file_size=$(stat -c%s $2)
if [[ ( $file_size -gt $max_size ) ]]; then
	rm $2
	echo "error"
fi

echo "success"

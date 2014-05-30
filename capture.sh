!#/bin/bash
min_size=1024
wkhtmltoimage --width 1280 $1 $2
actual_size=$(stat -c%s $2)
if [[ ( $actual_size -lt $min_size ) ]]; then
    wkhtmltoimage --custom-header 'User-Agent' 'Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30' --custom-header-propagation --enable-javascript --javascript-delay 1500 --no-stop-slow-scripts --debug-javascript --load-error-handling ignore --width 1280 "$1?&retry" $2
    actual_size=$(stat -c%s $2)
    if [[ ( $? -ne 0 ) || ( $actual_size -lt $min_size ) ]]; then
	echo "error"
	exit
    fi
fi
convert $2 -trim png8:$2-trimmed > /dev/null
mv $2-trimmed $2
echo "success"

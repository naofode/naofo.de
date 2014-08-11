#!/bin/bash
convert $1 -trim png8:$1-trimmed > /dev/null
mv $1-trimmed $1
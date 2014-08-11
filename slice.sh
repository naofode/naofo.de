#!/bin/bash
convert $1.png -crop 1x$2@ +repage +adjoin png8:$1_%d.png
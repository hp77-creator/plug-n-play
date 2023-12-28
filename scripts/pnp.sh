#!/bin/sh
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Plug n play PDFs
# @raycast.mode silent
#
# Optional parameters:
# @raycast.packageName pnp




if [ $# -eq 0 ]; then
	echo "Usage: $0 <url>"
	exit 1
fi

url="$1"
echo "URL: $url"
curl -# -O "$url"
latest_file=$(ls -t | head -n 1)
destination="/Users/himanshu.pandey/.plug_n_play/"
mv "$latest_file" "$destination"
open "$destination$latest_file"

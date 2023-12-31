#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title plug-n-play
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer utils
# @raycast.argument1 { "type": "text", "placeholder": "PDF url" }

# Documentation:
# @raycast.description plug your pdf url and directly view it in preview
# @raycast.author theboycalledhp
# @raycast.authorURL https://twitter.com/theboycalledhp


if [ $# -eq 0 ]; then
	echo "Usage: $0 <url>"
	exit 1
fi

url="$1"
echo "URL: $url"
curl -# -O "$url"
latest_file=$(ls -t | head -n 1)
echo "latest file location: $latest_file"
destination="$HOME/.plug_n_play"
if [ -d "$destination" ];
then
	mv "$latest_file" "$destination"
	open "$destination/$latest_file"
	exit 0
fi

mkdir "$destination"
mv "$latest_file" "$destination/"
open "$destination/$latest_file"


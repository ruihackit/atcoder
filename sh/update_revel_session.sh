#!/bin/bash

REVEL_SESSION=$(grep '^REVEL_SESSION=' ./.env | cut -d= -f2-)

if [ -z "$REVEL_SESSION" ]; then
    echo "Error: REVEL_SESSION value not found in .env."
    exit 1
fi

# acc側の置換
sed -i "s/REVEL_SESSION=[^\",]*/REVEL_SESSION=${REVEL_SESSION}/g" /root/.config/atcoder-cli-nodejs/session.json

# oj側の置換
sed -i "s/REVEL_SESSION=\"[^\"]*\"/REVEL_SESSION=\"${REVEL_SESSION}\"/g" /root/.local/share/online-judge-tools/cookie.jar

echo "REVEL_SESSION updated to '${REVEL_SESSION}' in acc/session.json and oj/cookie.jar."
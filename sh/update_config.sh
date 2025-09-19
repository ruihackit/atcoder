#!/bin/bash

# --- copy local config to system locations (simple) ---
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="$REPO_ROOT/config"
ACC_SRC="$CONFIG_DIR/acc"
OJ_SRC="$CONFIG_DIR/oj"
ACC_DST="/root/.config/atcoder-cli-nodejs"
OJ_DST="/root/.local/share/online-judge-tools"

if [ -d "$ACC_SRC" ]; then
    mkdir -p "$ACC_DST"
    if cp -a "$ACC_SRC/." "$ACC_DST/"; then
        echo "Copied acc config: $ACC_SRC -> $ACC_DST"
    else
        echo "Failed to copy acc config (permission?)"
    fi
else
    echo "Notice: '$ACC_SRC' not found, skipping acc copy"
fi

if [ -d "$OJ_SRC" ]; then
    mkdir -p "$OJ_DST"
    if cp -a "$OJ_SRC/." "$OJ_DST/"; then
        echo "Copied oj config: $OJ_SRC -> $OJ_DST"
    else
        echo "Failed to copy oj config (permission?)"
    fi
else
    echo "Notice: '$OJ_SRC' not found, skipping oj copy"
fi

# existing REVEL_SESSION replacement logic
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
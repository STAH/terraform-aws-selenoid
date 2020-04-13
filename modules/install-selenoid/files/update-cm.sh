#!/usr/bin/env bash

set -eu

latest_binary_url() {
    if latest_releases="$(curl --fail --silent --show-error --location https://api.github.com/repos/aerokube/cm/releases/latest)"; then
        echo "$latest_releases" \
        | grep "browser_download_url" \
        | grep linux \
        | cut -d : -f 2- \
        | sed 's/ //g; s/"//g'
        return 0
    else
        return 1
    fi
}

rm -f /usr/bin/cm-new
curl --fail --silent --show-error --output /usr/bin/cm-new --location "$(latest_binary_url)"
chmod 0755 /usr/bin/cm-new
mv -f /usr/bin/cm-new /usr/bin/cm

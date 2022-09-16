#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

cd /install

if [ ! -s "${FUD_HOME:-/app}/index.php" ]; then
  php install.php
fi

cd "${FUD_HOME:-/app}"

for r in install.php uninstall.php upgrade.php fudforum_archive; do
  test -f "${r}" && rm -v "${r}"
done

exec php \
	-S "${FUD_ADDR:-0.0.0.0:8000}" \
    -t . ${PHP_ARGS:-}

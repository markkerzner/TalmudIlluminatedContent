#!/bin/bash
# Deploy the static Talmud Illuminated site to the web host.
# Pushes every top-level directory (the tractate pages) AND every top-level
# file (homepage, stylesheet, search page + index, images) to the server.
# Shell scripts and a few repo-only files are skipped so they are not exposed
# under the public web root.

DEST="top8team@top8.biz:/home/top8team/public_html/talmudilluminated.com/"
PORT=7822

# Root files that should never be published (repo docs / scratch pages)
SKIP_FILES=("README.md" "test.html")
skip_file() { for s in "${SKIP_FILES[@]}"; do [[ $1 == "$s" ]] && return 0; done; return 1; }

# Tractate directories
for f in *; do
  if [[ -d ${f} ]]; then
    echo "dir:  ${f}"
    scp -r -P ${PORT} "${f}" "${DEST}"
  fi
done

# Root files: index.html, style.css, search.html, search-index.json, images, etc.
for f in *; do
  if [[ -f ${f} && ${f} != *.sh ]] && ! skip_file "${f}"; then
    echo "file: ${f}"
    scp -P ${PORT} "${f}" "${DEST}"
  fi
done

#!/bin/bash

log()  { echo -e "\x1b[1m[\x1b[93mLOG\x1b[0m\x1b[1m]\x1b[0m ${@}";  }
info() { echo -e "\x1b[1m[\x1b[92mINFO\x1b[0m\x1b[1m]\x1b[0m ${@}"; }
warn() { echo -e "\x1b[1m[\x1b[91mWARN\x1b[0m\x1b[1m]\x1b[0m ${@}"; }

thumbnails() {
	local PDFFILE="${1}"
	pushd "$(dirname ${PDFFILE})" > /dev/null
	local PDFFILE="$(basename ${PDFFILE})"
	if [[ -d "./thumbnails/" ]]; then rm -rf "./thumbnails/"; fi
	mkdir -p "./thumbnails/"
	local LASTPAGE=$(pdfinfo "${PDFFILE}" | grep 'Pages' | awk '{split($0, a, " "); print a[2]}')
	pdftoppm "${PDFFILE}" -f 1 -l 1 -png > ./thumbnails/first_page.png
	pdftoppm "${PDFFILE}" -f "${LASTPAGE}" -l "${LASTPAGE}" -png > ./thumbnails/last_page.png
	popd > /dev/null
}

#==============================================================================

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for file in $(find ./ -maxdepth 2 -name "*.pdf"); do
	log "Creating thumbnails for template : $(basename ${file})"
	thumbnails ${file}
done
IFS=$SAVEIFS

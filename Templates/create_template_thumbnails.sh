#!/bin/bash

log()  { echo -e "\x1b[1m[\x1b[93mLOG\x1b[0m\x1b[1m]\x1b[0m ${@}";  }
info() { echo -e "\x1b[1m[\x1b[92mINFO\x1b[0m\x1b[1m]\x1b[0m ${@}"; }
warn() { echo -e "\x1b[1m[\x1b[91mWARN\x1b[0m\x1b[1m]\x1b[0m ${@}"; }

is_installed(){
	local PROGRAM="${1}"
	local MESSAGE="${@:2:${#@}}"
	if [[ $(echo "$(which ${PROGRAM})" | wc -l) == 0 ]]; then
		echo -e "\x1b[1m[\x1b[91mWARN\x1b[0m\x1b[1m]\x1b[0m Could not find ${PROGRAM} in your system."
		echo -e "\x1b[1m[\x1b[92mINFO\x1b[0m\x1b[1m]\x1b[0m ${MESSAGE}"
		exit 1
	else
		return 0
	fi
}

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


is_installed "pdftoppm" "Install it with \x1b[1;33msudo apt-get install pdftoppm\x1b[0m"
is_installed "pdfinfo"  "Install it with \x1b[1;33msudo apt-get install pdfinfo\x1b[0m"

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for file in $(find ./ -maxdepth 3 -mindepth 2 -name "*.pdf"); do
	log "Creating thumbnails for template : $(basename ${file})"
	thumbnails ${file}
done
IFS=$SAVEIFS

#!/bin/bash -eu

PARAM_DIR=${1:?"NIE PODANO PARAMETRU"}

if ! [[ -d "${PARAM_DIR}" ]]; then
    echo "PODANY KATALOG NIE ISTNIEJE!"
    exit
fi

FILES=$(ls "$PARAM_DIR")

for FILE in $FILES; do
    echo $FILE
    if [[ "${FILE##*.}" == "bak" ]]; then
        if [[ -f "${PARAM_DIR}/${FILE}" ]]; then
            echo "Pliki .bak"
            chmod "uo-w" "${PARAM_DIR}/${FILE}"
        else
            echo "Katalogi .bak"
            chmod "ug-x" "o+x" "${PARAM_DIR}/${FILE}"
        fi
    elif [[ "${FILE##*.}" == "tmp" && -d "${PARAM_DIR}/${FILE}" ]]; then
        echo "Katalogi .tmp"
        chmod "-R 700 ${PARAM_DIR}/${DIRS}"
    elif [[ "${FILE##*.}" == "txt" && -f "${PARAM_DIR}/${FILE}" ]]; then
        echo "Pliki .txt"
        chmod "421" "${PARAM_DIR}/${FILE}"
    elif [[ "${FILE##*.}" == "exe" ]]; then
        echo "Pliki .exe"
        chmod "ugo+xs" "${PARAM_DIR}/${FILE}"
    fi
done

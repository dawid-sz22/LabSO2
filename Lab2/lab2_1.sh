#!/bin/bash -eu

DIR_1=${1:?"Brak sciezki 1"}
DIR_2=${2:?"Brak sciezki 2"}

if ! [[ -d "${DIR_1}" ]]; then
    echo "Podana ścieżka: ${DIR_1}, nie istnieje"
    exit
fi

if ! [[ -d "${DIR_2}" ]]; then
    echo "Podana ścieżka: ${DIR_2}, nie istnieje"
    exit
fi


ITEMS=$(ls "${DIR_1}")

for ITEM in ${ITEMS}; do
    EXTENSION="${ITEM##*.}"
    echo $EXTENSION
    echo $ITEM
    FILENAME="${ITEM%.*}"
    ABS_PATH=${PWD}

    if [[ -L  "${DIR_1}/${ITEM}" ]]; then
        echo "${ITEM}: dowiazanie symboliczne"
    elif [[ -d "${DIR_1}/${ITEM}" ]]; then
        echo "${ITEM}: katalog" 
        ln -s "$ABS_PATH/${DIR_1}/${ITEM}" "${DIR_2}/${FILENAME^^}_ln"
    elif [[ -f "${DIR_1}/${ITEM}" ]]; then
        echo "${ITEM}: plik regularny"
        if [[ "${FILENAME}" == "${EXTENSION}" ]]; then
            ln -s "$ABS_PATH//${DIR_1}/${ITEM}" "${DIR_2}/${FILENAME^^}_ln"
        else
            ln -s "$ABS_PATH//${DIR_1}/${ITEM}" "${DIR_2}/${FILENAME^^}_ln.${EXTENSION}"
        fi
    fi
done
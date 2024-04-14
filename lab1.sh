#!/bin/bash

SOURCE_DIR=${1:-lab_uno} # 1 to 1 aagument/ lab_uno wartość dom.
RM_LIST=${1:-2remove}
TARGET_DIR=${1:-bakap}

# if folder doesnt exist in TARGET_DIR -> create
if ! [[ -d "${TARGET_DIR}" ]]; then
    echo "Tworze katalog ${TARGET_DIR}"
    mkdir = "${TARGET_DIR}"
fi

# open list
FILES=$(cat $RM_LIST)

# delete all files from list in source_dir
for FILE in ${FILES}; do
    echo "Pracuje nad: ${FILE}"
    if [[ -f "${SOURCE_DIR}/${FILE}" ]]; then
        echo "Usuwam plik ${FILE}"
        rm -f  "${SOURCE_DIR}/${FILE}"
    fi
done

# create list of all files and folders in source_dir
LIST_FILES=$(ls ${SOURCE_DIR})

# mv if file/ cp if folder
for FILE in ${LIST_FILES}; do
    echo "Pracuje nad: ${FILE}"
    if [[ -f "${SOURCE_DIR}/${FILE}" ]]; then
        echo "Przenosze plik ${FILE}"
        mv "${SOURCE_DIR}/${FILE}" "${TARGET_DIR}/"
    elif [[ -d "${SOURCE_DIR}/${FILE}" ]]; then
        echo "Kopiuje katalog ${FILE}"
        cp -r "${SOURCE_DIR}/${FILE}" "${TARGET_DIR}/"
    fi
done

REST_FILES=$(ls ${SOURCE_DIR})
COUNTER=0
for FILE in ${REST_FILES}; do
    COUNTER=$((COUNTER+1))
    echo "JESZCZE TU JESTEM"
done

if [[ $COUNTER -ge 2 ]]; then
    echo "zostaly co najmniej 2 pliki"
fi

if [[ $COUNTER -ge 4 ]]; then
    echo "zostaly wiecej niz 4 pliki"
elif [[ $COUNTER -ge 2 ]]; then
    echo "jakis tam warunek tego typu"
elif [[ $COUNTER -eq 0 ]]; then
    echo "Żeby nie było niczego ~ Konon"
fi

# zipping
zip -r "bakap_$(date +"%Y-%m-%d").zip" "${TARGET_DIR}" 
#!/bin/bash

while IFS=, read -r ID FIRSTNAME SURNAME EMAIL GENDER IP WORTH; do
    if [[ $((ID % 2)) -eq 1 ]]; then
        echo "${ID} ${FIRSTNAME} ${SURNAME} ${EMAIL} ${GENDER} ${IP} ${WORTH}" 2>&1
    fi
done < sources/yolo.csv

while IFS=, read -r ID FIRSTNAME SURNAME EMAIL GENDER IP WORTH; do
    if [[ ${WORTH} =~ \$(2\.99|5\.99|9\.99)(M|B) ]]; then
        echo "${FIRSTNAME}" 2>&1
    fi
done < sources/yolo.csv
#!/bin/bash

$FILES=$(ls "./sources/groovies")

for FILE in $FILES do
    sed -i "'/Help docs:/d' ./sources/groovies/$FILE"
    sed -i '/class/a\String marker = '\/\!\@\$\%\/\' ./sources/groovies/one.groovy
done
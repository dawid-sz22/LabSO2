#!/bin/bash

grep -E '^64\.242\.88\.10 ' ./sources/access_log

grep -o  -E "DELETE .+" ./sources/access_log | uniq
#!/bin/bash

localeDir="../client/public/locales"

for locale in $localeDir/*; do
	localename=$(basename -- $locale)
	mkdir -p ../glossary/$localename
	for file in $localeDir/$localename/*.json; do
		filename=$(basename -- $file)
		npx i18next-json-csv-converter $file ../glossary/$localename/${filename%.*}.csv
	done
done

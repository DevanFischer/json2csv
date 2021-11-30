#!/bin/bash

for locale in ../client/public/locales/* ; do
	localename=$(basename -- $locale)
	mkdir -p ../glossary/$localename

	for file in ../client/public/locales/$localename/*.json
	do
		filename=$(basename -- $file)
		npx i18next-json-csv-converter $file ../glossary/$localename/${filename%.*}.csv
		echo "" >> $rootdir/glossary/$localename/${filename%.*}.csv
	done
done

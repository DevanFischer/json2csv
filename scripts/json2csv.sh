#!/bin/bash

for locale in ../client/public/locales/* ; do
	localename=$(basename -- $locale)
	# echo "$localename"
	mkdir -p ../glossary/$localename

	for file in ../client/public/locales/$localename/*.json
	do
		filename=$(basename -- $file)
        # echo $filename
		# cp -r $file ../glossary/$localename/${filename%.*}.txt
		npx i18next-json-csv-converter $file ../glossary/$localename/${filename%.*}.csv
		# npx i18next-json-csv-converter ../public/locales/$localename/$filename ../glossary/$localename/${filename%.*}.csv
		# echo "" >> $rootdir/glossary/$localename/${filename%.*}.csv
		# echo "glossary/${filename%.*}.csv"
	done
done

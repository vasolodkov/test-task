#!/bin/bash

# removing old files
PROD_FILES="docker-compose.yml .env.dev .env.prod"
for FILE in ${PROD_FILES}; do
	if [[ -f "$FILE" ]];
	then
  rm -rf "$FILE"
  fi
done

# finding files
YML_FILES=$(find . -type f -name "*.yml")
ENV_FILES=$(find . -type f -name "*.env")

# forming docker-compose command
COMMAND="docker-compose"
for FILE in $(echo "$YML_FILES"); do
  COMMAND="$COMMAND -f $FILE"
done

for FILE in $(echo "$ENV_FILES"); do
  cat "$FILE" >> .env.dev
done

# forming prod.json
sed 's/[{}]//g' "$(find . -name prod.json)" | sed 's/"//g' | sed 's/env://g' | sed 's/,//g' | sed '/^[[:space:]]*$/d' | sed 's/^[ \t]*//' | sed -e "s/:/=/" > .env.prod

# adding .env.dev to .env.prod if not in .env.prod
for LINE in $(cat .env.dev | sed 's/^[ \t]*//'); do
	if grep -q "$(echo "$LINE" | cut -d= -f1)" .env.prod;
	then
		echo "$LINE found"
	else
		echo "$LINE not found"
		echo "adding to .env.prod"
		echo "$LINE" >> .env.prod
	fi
done

# generating docker-compose.yml
COMMAND="$COMMAND --env-file .env.prod config"
$COMMAND > docker-compose.yml

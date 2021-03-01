#!/bin/bash

AUTHOR="$1"
PROJECTNAME="$2"

if [ -z "${AUTHOR}" ] ; then
    echo "Author must been not empty";
fi

if [ -z "${PROJECTNAME}" ] ; then
    echo "Project name must been not empty";
fi

# Info message
echo "The script prepares the project for installation and launch..."

# Make author plugin catalog
echo "Make author namespace plugins:"
mkdir -p "plugins/${AUTHOR:l}"
echo "--- [OK]"

# Set Author to files
echo "Set authorName to configuration files:"
for f in ".php_cs" ".phpcs.xml" "grumphp.yml" "phpstan.neon" "composer.json"
do
    sed -i -e "s/{author}/${AUTHOR:l}/g" $f
    rm $f-e
done
echo "--- [OK]"

# Set projectName
echo "Set projectName to configuration:"
for f in "docker-compose.yml"
do
    sed -i -e "s/{projectName}/${PROJECTNAME:l}/g" $f
    rm $f-e
done
echo "--- [OK]"

# Clone demo theme
echo "Cloning demo theme:"
git clone -b 1.1 https://github.com/octoberrain/demo-theme.git themes/demo/ && rm -rf themes/demo/.git
echo "--- [OK]"

# Env copy
echo "Create default .env"
cp .env.example .env
sed -i -e "s/{projectName}/${PROJECTNAME:l}/g" .env
rm .env-e
echo "--- [OK]"

# Delete build.sh
while true; do
    read -p "Delete bash.sh script ? [y/n]" yn
    case $yn in
        [Yy]* ) echo "Deleting bash.sh:" && rm bash.sh && echo "--- [OK]"; break;;
        [Nn]* ) echo "Bash.sh not deleted"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Info message
echo ""
echo "Project setup is complete. Please install composer and run start project."

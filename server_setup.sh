#!/bin/bash
. $(dirname "$0")/server_config.cfg

# Downloading main archive
wget $FILE_SERVER/$VERSION_NAME.zip -O $CURRENT_DIR/$VERSION_NAME.zip

# Unzipping...
unzip $CURRENT_DIR/$VERSION_NAME.zip

# Remove archive
rm -r $CURRENT_DIR/$VERSION_NAME.zip

# Downloading french models...
cd $CURRENT_DIR/$VERSION_NAME/
wget $FRENCH_MODELS_JAR


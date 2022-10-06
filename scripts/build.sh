#!/bin/sh

# 1. Create temporary directories
echo "Making Directory: /tmp/numbering"
mkdir -p /tmp/numbering

echo "Making Directory: db"
mkdir -p db

# 2. Fetch the numbering data from Ofcom
echo "Fetching Ofcom Numbering Data..."
wget -q http://www.ofcom.org.uk/static/numbering/codelist.zip -O /tmp/numbering/codelist.zip
echo "Done!"

# 3. Unzip the downloaded numbering data
echo "Unzipping numbering data..."
unzip -q -o /tmp/numbering/codelist.zip -d /tmp/numbering/
echo "Done!"

# 4. Run the import scripts and create the database
echo "Running sqlite3 build script..."
sqlite3 db/TelcoToolsCPData.db -init scripts/build.sql ""
echo "Done! You can now start the API!"

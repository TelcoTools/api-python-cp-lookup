#!/bin/sh

# 1. Create temporary directories
mkdir -p /tmp/numbering

# 2. Fetch the numbering data from Ofcom
wget -q http://www.ofcom.org.uk/static/numbering/codelist.zip -O /tmp/numbering/codelist.zip

# 3. Unzip the downloaded numbering data
unzip -q -o /tmp/numbering/codelist.zip -d /tmp/numbering/

# 4. Run the import scripts and create the database
sqlite3 db/TelcoToolsCPData.db -init scripts/build.sql ""

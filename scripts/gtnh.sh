#!/bin/bash

URL="https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.7.4_Server_Java_17-21.zip"

wget -O /tmp/archive.zip "$URL"
mkdir ./gt
unzip /tmp/archive.zip -d ./gt
mv ./gt/startserver-java9.sh ./gt/start.sh
chmod +x ./gt/start.sh
sudo mv ./gt/* /var/lib/mc-gtnh

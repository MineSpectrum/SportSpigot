#!/usr/bin/env bash

(
set -e
basedir="$(cd "$1" && pwd -P)"
workdir="$basedir/Paper/work"
mcver=$(cat "$workdir/BuildData/info.json" | grep minecraftVersion | cut -d '"' -f 4)
sportjar="$basedir/SportSpigot-Server/target/SportSpigot-$mcver.jar"
vanillajar="$workdir/$mcver/$mcver.jar"

(
    cd "$workdir/Paperclip"
    mvn clean package "-Dmcver=$mcver" "-Dpaperjar=$sportjar" "-Dvanillajar=$vanillajar"
)
cp "$workdir/Paperclip/target/paperclip-${mcver}.jar" "$basedir/origami-${mcver}.jar"

echo ""
echo ""
echo ""
echo "Build success!"
echo "Copied final jar to $(cd "$basedir" && pwd -P)/origami-${mcver}.jar"
)

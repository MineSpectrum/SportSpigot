#!/bin/bash
# get base dir regardless of execution location
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
basedir="../"
. $(dirname $SOURCE)/init.sh

paperVer=$(cat current-paper)

pushRepo SportSpigot-API $API_REPO master
pushRepo SportSpigot-Server $SERVER_REPO master
pushRepo mc-dev $MCDEV_REPO $paperVer

# Push Parent to Three Remotes
cd "$basedir"
git push origin master -f
git push bb-push master -f
git push gh-push master -f

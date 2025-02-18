#!/bin/bash

cd `dirname "$0"`/..

DIST=${1}
DIST=${DIST:=dist}

find ${DIST}/assets/avatars -type f ! \( -name 'newwhite.zip' \) -exec rm -f {} +
rm -rf ${DIST}/assets/sky
rm -rf ${DIST}/assets/3D
rm -rf ${DIST}/assets/fonts
rm -rf ${DIST}/assets/avatar-images
rm -rf ${DIST}/assets/SVG
rm -rf ${DIST}/assets/images
rm -rf ${DIST}/assets/src

mkdir -p ${DIST}/assets/fonts
cp -rp assets/fonts/css assets/fonts/webfonts assets/fonts/Roboto* assets/fonts/Poppins*.woff2 ${DIST}/assets/fonts

rm -rf ${DIST}/apps
rm -rf ${DIST}/docs

rm -rf ${DIST}/apiKey.js
rm -rf ${DIST}/apiKey-dev.js
cp apiKey.js-example ${DIST}/apiKey.js-example

rm -rf ${DIST}/behaviors
mkdir -p ${DIST}/behaviors/default
cp -rp behaviors/croquet ${DIST}/behaviors
cp -p behaviors/default/csmLights.js ${DIST}/behaviors/default/csmLights.js

rm -rf ${DIST}/worlds
mkdir -p ${DIST}/worlds
cp worlds/test.js ${DIST}/worlds/default.js

cp npm/package.json ${DIST}/package.json
cp npm/install.js ${DIST}/install.js
cp npm/gitignore ${DIST}/gitignore


os=$(uname)

if [ "$os" == "Darwin" ]; then
    sed -i '' 's/<!--//g' ${DIST}/index.html
    sed -i '' 's/-->//g' ${DIST}/index.html
elif [ "$os" == "Linux" ]; then
    sed -i 's/<!--//g' ${DIST}/index.html
    sed -i 's/-->//g' ${DIST}/index.html
else
    echo "Currently only macos and linux are supported"
fi

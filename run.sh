#/bin/bash

set -e

python build_fat_lib.py
echo

echo "Now creating example project..."
BUILD_DIR=`$HOME'/Library/Application Support/Titanium/mobilesdk/osx/3.5.0.GA/titanium.py' run | grep "\\[DEBUG\\] Staging module project at" | awk '{ print $6 }'`
BUILD_DIR=${BUILD_DIR}/`ls ${BUILD_DIR} | tail -n 1`
echo "Example project has built at ${EXAMPLE_DIR}"

EXAMPLE_DIR=`pwd`Example

if [ -d ${EXAMPLE_DIR} ]; then
  rm -r ${EXAMPLE_DIR}
fi
cp -R ${BUILD_DIR} ${EXAMPLE_DIR}
echo "Example project has created at ${EXAMPLE_DIR}"

./build.py
ZIP=`ls *.zip | sort | tail -n 1`

sed -i".bak" -E 's/	<\/?modules>//g' ${EXAMPLE_DIR}/tiapp.xml # remove duplicative directive

ti build -p iphone -F iphone -d ${EXAMPLE_DIR}

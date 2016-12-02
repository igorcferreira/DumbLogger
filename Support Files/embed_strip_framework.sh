#!/bin/bash
set -ex

STRIP_SCRIPT=$1
FRAMEWORK_NAME="${PROJECT_NAME}"
UNIVERSAL_LIBRARY_DIR="${BUILD_DIR}/${CONFIGURATION}-universal"
FRAMEWORK="${UNIVERSAL_LIBRARY_DIR}/${FRAMEWORK_NAME}.framework"

cp "${STRIP_SCRIPT}" "$FRAMEWORK" | echo
sed -i '' -e "s/^framework_bundle.*/framework_bundle=\"${FRAMEWORK_NAME}.framework\"/" $FRAMEWORK/strip_framework.sh


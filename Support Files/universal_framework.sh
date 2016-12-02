#!/bin/bash
set -ex
WORKSPACE_NAME=$1
SCHEME_NAME=$2
FRAMEWORK_NAME=$3
SIMULATOR_LIBRARY_PATH="${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${FRAMEWORK_NAME}.framework"
DEVICE_LIBRARY_PATH="${BUILD_DIR}/${CONFIGURATION}-iphoneos/${FRAMEWORK_NAME}.framework"
UNIVERSAL_LIBRARY_DIR="${BUILD_DIR}/${CONFIGURATION}-universal"
FRAMEWORK="${UNIVERSAL_LIBRARY_DIR}/${FRAMEWORK_NAME}.framework"

######################
# Build Frameworks
cd "$SRCROOT"
xcrun xcodebuild -workspace ../${WORKSPACE_NAME}.xcworkspace \
                 -scheme "${SCHEME_NAME}" \
                 -sdk iphonesimulator \
                 -configuration ${CONFIGURATION} \
      build \
        CONFIGURATION_BUILD_DIR=${BUILD_DIR}/${CONFIGURATION}-iphonesimulator \
        PLATFORM_NAME=iphonesimulator 2>&1

xcrun xcodebuild -workspace ../${WORKSPACE_NAME}.xcworkspace \
                 -scheme "${SCHEME_NAME}" \
                 -sdk iphoneos \
                 -configuration ${CONFIGURATION} \
      build \
        CONFIGURATION_BUILD_DIR=${BUILD_DIR}/${CONFIGURATION}-iphoneos \
        PLATFORM_NAME=iphoneos 2>&1

######################
# Create directory for universal
rm -rf "${FRAMEWORK}"
mkdir -p "${FRAMEWORK}"

######################
# Copy files Framework
cp -r "${DEVICE_LIBRARY_PATH}/." "${FRAMEWORK}"

######################
# Make an universal binary
lipo "${SIMULATOR_LIBRARY_PATH}/${FRAMEWORK_NAME}" "${DEVICE_LIBRARY_PATH}/${FRAMEWORK_NAME}" -create -output "${FRAMEWORK}/${FRAMEWORK_NAME}" | echo

# For Swift framework, Swiftmodule needs to be copied in the universal framework
if [ -d "${SIMULATOR_LIBRARY_PATH}/Modules/${FRAMEWORK_NAME}.swiftmodule/" ]; then
cp -f "${SIMULATOR_LIBRARY_PATH}/Modules/${FRAMEWORK_NAME}.swiftmodule/"* "${FRAMEWORK}/Modules/${FRAMEWORK_NAME}.swiftmodule/" | echo
fi

if [ -d "${DEVICE_LIBRARY_PATH}/Modules/${FRAMEWORK_NAME}.swiftmodule/" ]; then
cp -f "${DEVICE_LIBRARY_PATH}/Modules/${FRAMEWORK_NAME}.swiftmodule/"* "${FRAMEWORK}/Modules/${FRAMEWORK_NAME}.swiftmodule/" | echo
fi

#open "${FRAMEWORK}/.."

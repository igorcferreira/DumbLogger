#!/bin/bash
copy_frameworks()
{
    FRAMEWORK_NAME=$1

    DESTINATION_FRAMEWORK_PATH="${SRCROOT}/../bin/"

    if [ ! -d "${DESTINATION_FRAMEWORK_PATH}" ]; then
        mkdir -p "${DESTINATION_FRAMEWORK_PATH}"
    fi
    
    FRAMEWORK_PATH="${BUILD_DIR}/${CONFIGURATION}-universal/${FRAMEWORK_NAME}"
    if [ -L "${FRAMEWORK_PATH}" ]; then
    echo "Symlinked..."
    FRAMEWORK_PATH="$(readlink "${FRAMEWORK_PATH}")"
    fi
    
    rsync -av "${FRAMEWORK_PATH}" "${DESTINATION_FRAMEWORK_PATH}"
}

for framework in $*; do 
    copy_frameworks $framework
done

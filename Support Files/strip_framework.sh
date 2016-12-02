#!/bin/bash
set -ex
function codesign_if_needed() {
  binary=$1
  if [ -n "${EXPANDED_CODE_SIGN_IDENTITY}" -a "${CODE_SIGNING_REQUIRED}" != "NO" -a "${CODE_SIGNING_ALLOWED}" != "NO" ]; then
    echo "Code Signing $binary with Identity ${EXPANDED_CODE_SIGN_IDENTITY_NAME}"
    echo "/usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} --preserve-metadata=identifier,entitlements \"$binary\""
    /usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} --preserve-metadata=identifier,entitlements "$binary"
  fi
}

function strip_invalid_archs() {
  binary="$1"
  archs=$(lipo -info "$binary" | rev | cut -d ':' -f1 | rev)
  stripped_archs=""
  for arch in $archs; do
      if [[ "$VALID_ARCHS" != *"$arch"* ]]; then
          lipo -remove "$arch" -output "$binary" "$binary" || exit 1
          stripped_archs="$stripped_archs $arch"
      fi
  done
  echo "Stripped $binary of architectures:$stripped_archs"
}

function remove_strip_file() {
  echo "Removing strip-framework.sh from embedded framework"
  rm -f "$framework_folder/strip_framework.sh"
}

function move_vcsymbolmap() {
  echo "Copying .bcsymbolmap files to .xcarchive"
  if [-d "$framework_folder/BCSymbolMaps" ]; then
    find "$framework_folder/BCSymbolMaps" -name '*.bcsymbolmap' -type f -exec mv {} "$CONFIGURATION_BUILD_DIR" \;
    rm -rf "$framework_folder/BCSymbolMaps"
  fi
}

framework_bundle="$1"
framework_name="${framework_bundle%.*}"

cd "$BUILT_PRODUCTS_DIR/$FRAMEWORKS_FOLDER_PATH"

framework_folder="./$framework_bundle"
framework="$framework_folder/$framework_name"
  
[[ $(file "$framework") != *"dynamically linked shared library"* ]] && exit 0

strip_invalid_archs "$framework"
remove_strip_file
codesign_if_needed "$framework"

if [ "$ACTION" == "install" ]; then
  move_vcsymbolmap
fi


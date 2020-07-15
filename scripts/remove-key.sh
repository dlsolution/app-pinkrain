#!/bin/bash

KEY_CHAIN=ios-build.keychain

# Delete keychain
security delete-keychain $KEY_CHAIN

# Delete certicate & mobileprovision profile
rm -f scripts/certs/development_13072020.cer
rm -f scripts/certs/development_13072020.p12
rm -f scripts/certs/distribution_13072020.cer
rm -f scripts/certs/distribution_13072020.p12
rm -f scripts/profiles/match_Development_vndlsolutiondevpinkrain.mobileprovision
rm -f scripts/profiles/match_AppStore_vndlsolutionpinkrain.mobileprovision
rm -f scripts/profiles/match_AdHoc_vndlsolutiondevpinkrain.mobileprovision

rm -f ~/Library/MobileDevice/Provisioning\ Profiles/match_Development_vndlsolutiondevpinkrain.mobileprovision
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/match_AppStore_vndlsolutionpinkrain.mobileprovision
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/match_AdHoc_vndlsolutiondevpinkrain.mobileprovision

# list provisioning profile 
echo "--- list provisioning profile ---"
ls ~/Library/MobileDevice/Provisioning\ Profiles
echo "--- ****** ---"

echo "--- list scripts profile ---"
ls ./scripts/profiles
ls ./scripts/certs
echo "--- ****** ---"

echo "--- list keychains: ---"
security list-keychains
echo "--- ****** ---"

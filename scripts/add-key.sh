#!/bin/bash

# Decrypting certs and profiles (not sure if profiles actually need to be encrypted, but this is how others did it so I'm following the same route just to be on the safe side)
# ENCRYPTION_SECRET is ENV
# dev
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "scripts/certs/development_13072020.cer.enc" -out "scripts/certs/development_13072020.cer" -a -d
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "scripts/certs/development_13072020.p12.enc" -out "scripts/certs/development_13072020.p12" -a -d
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "scripts/profiles/match_Development_vndlsolutiondevpinkrain.mobileprovision.enc" -out "scripts/profiles/match_Development_vndlsolutiondevpinkrain.mobileprovision" -a -d

# appstore
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "scripts/certs/distribution_13072020.cer.enc" -out "scripts/certs/distribution_13072020.cer" -a -d
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "scripts/certs/distribution_13072020.p12.enc" -out "scripts/certs/distribution_13072020.p12" -a -d
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "scripts/profiles/match_AppStore_vndlsolutionpinkrain.mobileprovision.enc" -out "scripts/profiles/match_AppStore_vndlsolutionpinkrain.mobileprovision" -a -d

# adhoc
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "scripts/profiles/match_AdHoc_vndlsolutiondevpinkrain.mobileprovision.enc" -out "scripts/profiles/match_AdHoc_vndlsolutiondevpinkrain.mobileprovision" -a -d

# create & add certificates to keychain
KEY_CHAIN=ios-build.keychain

# Create a custom keychain
security create-keychain -p $KEYCHAIN_PASSWORD $KEY_CHAIN

# Make the custom keychain default, so xcodebuild will use it for signing
security default-keychain -s $KEY_CHAIN

# Unlock the keychain
security unlock-keychain -p $KEYCHAIN_PASSWORD $KEY_CHAIN

# Set keychain timeout to 1 hour for long builds
security set-keychain-settings -t 3600 -u $KEY_CHAIN
 
# Add certificates to keychain and allow codesign to access them
security import "./scripts/certs/development_13072020.cer" -k $KEY_CHAIN -T /usr/bin/codesign
security import "./scripts/certs/distribution_13072020.cer" -k $KEY_CHAIN -T /usr/bin/codesign
 
security import "./scripts/certs/development_13072020.p12" -k $KEY_CHAIN -P $KEY_PASSWORD  -T /usr/bin/codesign
security import "./scripts/certs/distribution_13072020.p12" -k $KEY_CHAIN -P $KEY_PASSWORD  -T /usr/bin/codesign
 
echo "--- list keychains: ---"
security list-keychains
echo "--- ****** ---"
 
echo "--- find indentities keychains: ---"
security find-identity -p codesigning ~/Library/Keychains/ios-build.keychain
echo "--- ****** ---"
 
# Create folder to put the provisioning profile
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./scripts/profiles/match_Development_vndlsolutiondevpinkrain.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/dev.mobileprovision
cp ./scripts/profiles/match_AdHoc_vndlsolutiondevpinkrain.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/adhoc.mobileprovision
cp ./scripts/profiles/match_AppStore_vndlsolutionpinkrain.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/appstore.mobileprovision
 
echo "--- show provisioning profile: ---"
ls ~/Library/MobileDevice/Provisioning\ Profiles
echo "--- ****** ---"
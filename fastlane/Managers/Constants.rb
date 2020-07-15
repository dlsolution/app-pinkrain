# frozen_string_literal: true
class Constants
    #################
    #### PROJECT ####
    #################

    # FIREBASE_APP_ID_DEV
    def self.FIREBASE_APP_ID_DEV
        '1:117648018079:ios:671f4ec6c43826ad66f0aa'
    end

    # FIREBASE_APP_ID_STAGING
    def self.FIREBASE_APP_ID_STAGING
        '1:117648018079:ios:ddfd19a50e0ee81a66f0aa'
    end

    # FIREBASE_APP_ID
    def self.FIREBASE_CLI_PATH
        '/usr/local/bin/firebase'
    end

    # KEYCHAIN_NAME
    def self.TARGET_FILTER
        'PinkRain'
    end

    # KEYCHAIN_NAME
    def self.KEYCHAIN_NAME
        'ios-build.keychain'
    end

    # KEYCHAIN_PASSWORD
    def self.KEYCHAIN_PASSWORD
        ENV["KEYCHAIN_PASSWORD"]
    end

    # SLACK_URL
    def self.SLACK_URL
        ENV["SLACK_URL"]
    end

    # a WORKSPACE path
    def self.WORKSPACE
        './PinkRain.xcworkspace'
    end

    # XCODEPROJ
    def self.XCODEPROJ
        'PinkRain.xcodeproj'
    end

    # SCHEME_NAME_DEV
    def self.SCHEME_NAME_DEV
        'PinkRain-Dev'
    end

    # SCHEME_NAME_STAGING
    def self.SCHEME_NAME_STAGING
        'PinkRain-STG'
    end

    # SCHEME_NAME_PRODUCTION
    def self.SCHEME_NAME_PRODUCTION
        'PinkRain'
    end

    # PRODUCT_NAME_DEV
    def self.PRODUCT_NAME_DEV
        'PinkRain_Dev.ipa'
    end

    # PRODUCT_NAME_STAGING
    def self.PRODUCT_NAME_STAGING
        'PinkRain_STG.ipa'
    end

    # PRODUCT_NAME_PRODUCTION
    def self.PRODUCT_NAME_PRODUCTION
        'PinkRain.ipa'
    end

    # CONFIGURATION_DEV
    def self.CONFIGURATION_DEV
        'Debug'
    end

    # CONFIGURATION_STAGING
    def self.CONFIGURATION_STAGING
        'Staging'
    end

    # CONFIGURATION_PRODUCTION
    def self.CONFIGURATION_PRODUCTION
        'Release'
    end

    # OUTPUT_DIRECTORY
    def self.OUTPUT_DIRECTORY
        './build'
    end

    # FIREBASE_TESTER_GROUPS
    def self.FIREBASE_TESTER_GROUPS
        'Dev, Tester'
    end

    # FIREBASE_CLIENT_GROUPS
    def self.FIREBASE_CLIENT_GROUPS
        'Client'
    end

    # PATH_RELEASE_NOTES_FILE
    def self.PATH_RELEASE_NOTES_DEV
        './fastlane/release_notes_dev.txt'
    end

    # PATH_RELEASE_NOTES_FILE
    def self.PATH_RELEASE_NOTES_STAGING
        './fastlane/release_notes_staging.txt'
    end

    # BUNDLE_ID_DEV
    def self.BUNDLE_ID_DEV
        'vn.dlsolution.dev.pinkrain'
    end

    # BUNDLE_ID_STAGING
    def self.BUNDLE_ID_STAGING
        'vn.dlsolution.adhoc.pinkrain'
    end

    # BUNDLE_ID_PRODUCTION
    def self.BUNDLE_ID_PRODUCTION
        'vn.dlsolution.pinkrain'
    end

    # DEV_PORTAL_APPLE_ID
    def self.DEV_PORTAL_APPLE_ID
        ENV["FASTLANE_USER"]
    end

    # DEV_PORTAL_TEAM_ID
    def self.DEV_PORTAL_TEAM_ID
        ENV["FASTLANE_TEAM_ID"]
    end
end
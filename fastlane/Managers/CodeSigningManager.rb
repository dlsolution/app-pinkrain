class CodeSigningManager
    def initialize(
        fastlane:,
        keychain_name:,
        keychain_password:,
        bundle_id_dev:,
        bundle_id_staging:,
        bundle_id_production:,
        dev_portal_apple_id:,
        dev_portal_team_id:
    )
        @fastlane = fastlane
        @keychain_name = keychain_name
        @keychain_password = keychain_password
        @bundle_id_dev = bundle_id_dev
        @bundle_id_staging = bundle_id_staging
        @bundle_id_production = bundle_id_production
        @dev_portal_apple_id = dev_portal_apple_id
        @dev_portal_team_id = dev_portal_team_id
    end

    # create_keychain_if_needed
    def keychain_path(keychain_name:)
        path = "~/Library/Keychains/#{keychain_name}.keychain-db"
        File.expand_path(path)
    end

    def create_keychain_if_needed(keychain_name:, keychain_password:)
        unless File.exist?(keychain_path(keychain_name: keychain_name))
            keychain_password = @fastlane.is_ci ? keychain_password : @fastlane.prompt(
              text: "\n\n 🔐 Creating '#{keychain_name}' keychain ... \n\n 🔑 Please fill in '#{keychain_name}' keychain's password: ",
              secure_text: true
            )
            @fastlane.create_keychain(
              name: keychain_name,
              password: keychain_password,
              default_keychain: @fastlane.is_ci? ? true : false,
              unlock: true,
              timeout: @fastlane.is_ci? ? false : 300
            )
        end
    end

    # remove_keychain
    def remove_keychain
        @fastlane.delete_keychain(
          name: @keychain_name
        )
    end

    def sync_code_sign(update_development:, update_adhoc:, update_appstore:)
        create_keychain_if_needed(
          keychain_name: @keychain_name,
          keychain_password: @keychain_password
        )
    
        match_development(update: update_development)
        match_adhoc(update: update_adhoc)
        match_appstore(update: update_appstore)
    end

    # sync_code_sign for dev
    def sync_code_sign_dev(update_development:)
        create_keychain_if_needed(
            keychain_name: @keychain_name,
            keychain_password: @keychain_password
        )
        match_development(update: update_development)
    end

    # sync_code_sign for staging
    def sync_code_sign_staging(update_adhoc:)
        create_keychain_if_needed(
            keychain_name: @keychain_name,
            keychain_password: @keychain_password
        )
        match_adhoc(update: update_adhoc)
    end

    # sync_code_sign for appstore
    def sync_code_sign_appstore(update_appstore:)
        create_keychain_if_needed(
            keychain_name: @keychain_name,
            keychain_password: @keychain_password
        )
        match_appstore(update: update_appstore)
    end

    # match_development
    def match_development(update: false)
        @fastlane.match(
          type: 'development',
          app_identifier: @bundle_id_dev,
          keychain_name: @keychain_name,
          keychain_password: @keychain_password,
          force_for_new_devices: update,
          force: update,
          readonly: !update,
          username: @dev_portal_apple_id,
          team_id: @dev_portal_team_id
        )
    end

    # match_adhoc
    def match_adhoc(update: false)
        @fastlane.match(
          type: 'adhoc',
          app_identifier: @bundle_id_staging,
          keychain_name: @keychain_name,
          keychain_password: @keychain_password,
          force_for_new_devices: update,
          force: update,
          readonly: !update,
          username: @dev_portal_apple_id,
          team_id: @dev_portal_team_id
        )
    end

    # match_appstore
    def match_appstore(update: false)
        @fastlane.match(
          type: 'appstore',
          app_identifier: @bundle_id_production,
          keychain_name: @keychain_name,
          keychain_password: @keychain_password,
          force_for_new_devices: update,
          force: update,
          readonly: !update,
          username: @dev_portal_apple_id,
          team_id: @dev_portal_team_id
        )
    end

    # import manually (dont use match)
    def sync_code_sign_manually
        @fastlane.import_certificate(
            keychain_name: @keychain_name,
            keychain_password: @keychain_password,
            certificate_path: '@certificate_path_dev',
            certificate_password: '@certificate_password',
        )

        @fastlane.update_project_provisioning(
            xcodeproj: '@xcodeproj',
            profile: '@profile_dev',
            target_filter: '@target_filter',
            build_configuration: '@build_configuration_dev',
        )
    end
end

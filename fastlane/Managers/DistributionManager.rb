class DistributionManager
    def initialize(
        fastlane:,
        firebase_cli_path:
    )
        @fastlane = fastlane
        @firebase_cli_path = firebase_cli_path
    end
  
    def upload_to_firebase(groups:, release_notes_file:, firebase_app_id:)
        @fastlane.firebase_app_distribution(
            app: firebase_app_id,
            groups: groups,
            release_notes_file: release_notes_file,
            firebase_cli_path: @firebase_cli_path
        )
    end
  
    def upload_to_appstore_connect(product_name:, bundle_identifier:)
        @fastlane.deliver(
            ipa: "#{@build_path}/#{product_name}.ipa",
            app_identifier: bundle_identifier,
            force: true,
            skip_metadata: true,
            skip_screenshots: true
        )
    end
  end
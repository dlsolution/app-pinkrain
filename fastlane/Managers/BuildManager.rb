class BuildManager
    def initialize(
        fastlane:,
        workspace:,
        scheme_name_dev:,
        scheme_name_staging:,
        scheme_name_production:,
        product_name_dev:,
        product_name_staging:,
        product_name_production:,
        configuration_dev:,
        configuration_staging:,
        configuration_production:,
        output_directory:,
        xcodeproj:
    )
        @fastlane = fastlane
        @workspace = workspace
        @scheme_name_dev = scheme_name_dev
        @scheme_name_staging = scheme_name_staging
        @scheme_name_production = scheme_name_production
        @product_name_dev = product_name_dev
        @product_name_staging = product_name_staging
        @product_name_production = product_name_production
        @configuration_dev = configuration_dev
        @configuration_staging = configuration_staging
        @configuration_production = configuration_production
        @output_directory = output_directory
        @xcodeproj = xcodeproj
    end

    def build_develop
        @fastlane.increment_build_number(
            xcodeproj: @xcodeproj
        )

        @fastlane.gym(
            scheme: @scheme_name_dev,
            workspace: @workspace,
            configuration: @configuration_dev,
            output_name: @product_name_dev,
            silent: true,
            clean: true,
            include_bitcode: false,
            output_directory: @output_directory,
            export_method: "development",
        )
    end

    def build_staging
        @fastlane.increment_build_number(
            xcodeproj: @xcodeproj
        )

        @fastlane.gym(
            scheme: @scheme_name_staging,
            workspace: @workspace,
            configuration: @configuration_staging,
            output_name: @product_name_staging,
            silent: true,
            clean: true,
            include_bitcode: false,
            output_directory: @output_directory,
            export_method: "ad-hoc",
        )
    end

    def build_appstore
        @fastlane.gym(
            scheme: @scheme_name_production,
            workspace: @workspace,
            configuration: @configuration_production,
            output_name: @product_name_production,
            silent: true,
            clean: true,
            include_bitcode: true,
            output_directory: @output_directory,
            export_method: "app-store",
        )
    end
end
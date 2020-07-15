class VersionManager
    def initialize(
        fastlane:,
        xcodeproj:,
        main_target_name:
    )
        @fastlane = fastlane
        @xcodeproj = xcodeproj
        @main_target_name = main_target_name
    end
  
    def build_number=(build_number)
        @fastlane.increment_build_number(
            build_number: build_number,
            xcodeproj: @xcodeproj
        )
    end
  
    def build_number
        @fastlane.get_build_number(xcodeproj: @xcodeproj)
    end
  
    def version_number
        @fastlane.get_version_number(
            xcodeproj: @xcodeproj,
            target: @main_target_name
        )
    end
  
    def version_number=(version_number)
        @fastlane.increment_version_number(
            version_number: version_number,
            xcodeproj: @xcodeproj
        )
    end
  
    def version_and_build_number
        "#{version_number} (Build: #{build_number})"
    end
  end
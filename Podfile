# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
inhibit_all_warnings!

def rx_swift
    pod 'RxSwift',          '~> 5.1.1'
end

def rx_cocoa
    pod 'RxCocoa',          '~> 5.1.1'
end

def util_pods
    pod 'SVProgressHUD',    '~> 2.2.5'
    pod 'QueryKit',         '~> 0.14.1'
    pod 'Firebase/Analytics'
    pod 'Firebase/Messaging'
end

def test_pods
    pod 'RxTest',           '~> 5.1.1'
    pod 'RxBlocking',       '~> 5.1.1'
    pod 'Nimble',           '~> 8.0.4'
    pod 'Quick',            '~> 2.2.0'
end

target 'PinkRain' do
  use_frameworks!
  rx_cocoa
  rx_swift
  util_pods

  target 'PinkRainTests' do
    inherit! :search_paths
    test_pods
  end
end

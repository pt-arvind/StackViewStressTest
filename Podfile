source 'https://github.com/CocoaPods/Specs.git'
source 'git@github.com:weddingwire/specs-ios.git'
platform :ios, '9.0'

use_frameworks!

def shared_pods
  pod 'SnapKit', '~> 0.18.0'
end

def testing_pods
  pod 'Quick', '~> 0.8.0'
  pod 'Nimble', '~> 3.1.0'

  pod 'OHHTTPStubs'
  pod 'OHHTTPStubs/Swift'
end

target 'StackViewLimit' do
  shared_pods
end

target 'StackViewLimitTests' do
  shared_pods
  testing_pods
end

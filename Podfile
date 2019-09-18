platform :ios, '12.0'
swift_version = '5'
use_frameworks!
inhibit_all_warnings!

def framework_pods
	pod 'SwiftLint'
	pod 'SwiftGen', '~> 6.0'
	pod 'Moya', '~> 13.0'
end

def helper_pods
	pod 'Kingfisher', '~> 5.0'
	pod 'Then'
	pod 'SnapKit', '~> 5.0.0'
end

def required_pods
	helper_pods
	framework_pods
end

target 'Test' do
	required_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|  
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = swift_version
      end 
  end
end 

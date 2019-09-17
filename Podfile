platform :ios, '12.0'
swift_version = '5'
use_frameworks!
inhibit_all_warnings!

def framework_pods
	pod 'SwiftLint'
	pod 'SwiftGen', '~> 6.0'
end

def required_pods
	framework_pods
end

target 'Test' do
	required_pods
end

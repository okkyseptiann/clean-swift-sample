#
# Be sure to run `pod lib lint TestLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TestLib'
  s.version          = '1.0.1'
  s.summary          = 'the library using for access superapp file and function'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'the library using for access superapp file and function so you need to use this pod to makesure your project will override the function from superapps'

  s.homepage         = 'https://github.com/okkyseptiann'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'okky.septian@koinworks.com' => 'okky.septian@koinworks.com' }
  s.source           = { :git => 'https://github.com/okkyseptiann/clean-swift-sample.git', :tag => '1.0.1'}
  s.swift_versions   = '4.0'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TestLib/Classes/**/*'
  
#   s.resource_bundles = {
#     'TestLib' => ['TestLib/Assets/*.png']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

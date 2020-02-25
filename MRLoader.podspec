#
# Be sure to run `pod lib lint MRLoader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MRLoader'
  s.version          = '1.0.2'
  s.swift_version    = '5.0'
  s.summary          = 'Light weight and simple in Swift spinning loader'
  s.description      = 'Light weight and simple Laoder in Swift that make spinning loader on your iOS applications'
  s.homepage         = 'https://github.com/masoudroosta/MRLoader.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Masoud Roosta' => 'masdevoud@gmail.com , m.sedaghatfard@gmail.com'}
  s.source           = { :git => 'https://github.com/masoudroosta/MRLoader.git', :tag => '1.0.2' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.3'

  s.source_files = 'MRLoader/Classes/**/*'
  s.platform = :ios, "10.3"
  s.requires_arc = true
  
  # s.resource_bundles = {
  #   'MRLoader' => ['MRLoader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end

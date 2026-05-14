#
# Be sure to run `pod lib lint DGCLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DGCLog'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight Swift logging utility with console and file outputs.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DGCLog provides a simple static logging API for iOS apps.
It writes logs to both the Xcode console and rotating local log files
through SwiftyBeaver, helping with runtime diagnostics and issue tracing.
                       DESC

  s.homepage         = 'https://github.com/admin/DGCLog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'admin' => 'huan.xin@renrengame.com' }
  s.source           = { :git => 'https://github.com/admin/DGCLog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'DGCLog/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DGCLog' => ['DGCLog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
#  s.dependency 'CocoaLumberjack/Swift'
  s.dependency 'SwiftyBeaver'
end

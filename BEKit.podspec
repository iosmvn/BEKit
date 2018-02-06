#
# Be sure to run `pod lib lint BEKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BEKit'
  s.version          = "0.8.4"
  s.summary          = "BEKit是基础扩展工具包（Base Extended Kit）核心代码."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        BEKit（Base Extended Kit）是一些基础功能代码、工具类、基类的集合，旨在快速实现基础功能。
                       DESC

  s.homepage         = "http://iospai.com"
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '孙丹龙' => 'sundanlong@gmail.com' }
  s.source           = { :git => "https://github.com/iosmvn/BEKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'BEKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BEKit' => ['BEKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

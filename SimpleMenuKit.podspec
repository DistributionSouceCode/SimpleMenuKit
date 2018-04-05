#
# Be sure to run `pod lib lint SimpleMenuKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleMenuKit'
  s.version          = '0.2.0'
  s.summary          = 'SimpleMenuKit that is easy slide menu for programmatically development.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"SimpleMenuKit is a CocoaPod that is easy for user build slide menu programmatically. It build from simple idea with simeple code and associate with simple developer programmatically. I am very happy to get comment from you, don't be hesitate. We are developer we learn together and we grow up together."
                       DESC

  s.homepage         = 'https://github.com/DistributionSouceCode/SimpleMenuKit.git'
  s.screenshots     = 'https://github.com/DistributionSouceCode/SimpleMenuKit/blob/master/Example/SimpleMenuKit/menukit.gif',
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'seyhagithub' => 'hiemseyha168@gmail.com' }
  s.source           = { :git => 'https://github.com/DistributionSouceCode/SimpleMenuKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SimpleMenuKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SimpleMenuKit' => ['SimpleMenuKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

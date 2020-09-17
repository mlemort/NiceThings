#
# Be sure to run `pod lib lint NiceThings.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NiceThings'
  s.version          = '0.1.0'
  s.summary          = 'The pod NiceThings compile cool features i wish i could see natively in the Swift langage.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This pod regroupe nice and usefull things i often use in my iOS projects.
  It works with subspec so you could just import the thing you want in your project.
  See the Readme for exemple.
                       DESC

  s.homepage         = 'https://github.com/mlemort/NiceThings'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mlemort' => 'maxime.lemort@viseo.fr' }
  s.source           = { :git => 'https://github.com/mlemort/NiceThings.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.3'
  s.swift_version = '5.0'

  # s.resource_bundles = {
  #   'NiceThings' => ['NiceThings/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.subspec 'ArrayRemoveFirstObjectMaching' do |aro|
    aro.source_files = "NiceThings/Classes/ArrayRemoveFirstObjectMaching/**/*.swift"
  end

  s.subspec 'MulticastDelegate' do |md|
    md.source_files = "NiceThings/Classes/MulticastDelegate/**/*.swift"
  end

  s.subspec 'CollectionSafeSubscript' do |ss|
    ss.source_files = "NiceThings/Classes/CollectionSafeSubscript/**/*.swift"
  end

  s.subspec 'ConditionalAssignmentOperator' do |cao|
      cao.source_files = "NiceThings/Classes/ConditionalAssignmentOperator/**/*.swift"
  end

  s.subspec 'DictionaryMapToDictionary' do |dict|
      dict.source_files = "NiceThings/Classes/DictionaryMapToDictionary/**/*.swift"
  end

  s.subspec 'OptionalIsNilOrEmpty' do |dict|
      dict.source_files = "NiceThings/Classes/OptionalIsNilOrEmpty/**/*.swift"
  end

  s.subspec 'Swerl' do |swerl|
      swerl.source_files = "NiceThings/Classes/Swerl/**/*.swift"
  end

end

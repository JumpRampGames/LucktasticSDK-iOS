#  Be sure to run `pod spec lint LucktasticSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.

Pod::Spec.new do |s|
  s.name             = 'LucktasticSDK'
  s.version          = '0.4'
  s.summary          = 'Lucktastic Ad SDK'
  s.description      = 'Integrated ad platform with chances to win real prizes!'
  s.homepage         = 'https://github.com/JumpRampGames'
  # s.license             = { :type => 'JRG', :file => 'LICENSE' }
  s.author              = { 'Adam Spector' => 'adamspector@jumprampgames.com' }
  s.source              = { :git => 'https://github.com/JumpRampGames/LucktasticSDK-iOS.git', :tag => s.version.to_s }
  s.platform            = :ios, "8.0"
  # s.source_files        = 'SDK/**/*.{h,m}'
  # s.resources = 'SDK/**/*.xib'
  # s.exclude_files = ['SDK/SDWebImage/**/*', 'SDK/LucktasticSDK.xcodeproj']
  s.ios.vendored_frameworks = 'LucktasticSDK.framework'
  s.dependency 'SDWebImage', '~>4.0'
  s.requires_arc = true
end

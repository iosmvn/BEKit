Pod::Spec.new do |s|
  s.name = 'BEKit'
  s.version = '0.0.8'
  s.summary = 'BEKit是基础扩展工具包（Base Extended Kit）核心代码.'
  s.license = 'MIT'
  s.authors = {"孙丹龙"=>"sundanlong@gmail.com"}
  s.homepage = 'http://iospai.com'
  s.description = 'BEKit（Base Extended Kit）是一些基础功能代码、工具类、基类的集合，旨在快速实现基础功能。'
  s.requires_arc = true
  s.source = {
  	"git": "https://github.com/AFNetworking/AFNetworking.git",
    "tag": "0.0.8"
  }

  s.platform = :ios, '7.0'
  s.ios.platform             = :ios, '7.0'
  s.ios.preserve_paths       = 'ios/BEKit.framework'
  s.ios.public_header_files  = 'ios/BEKit.framework/Versions/A/Headers/*.h'
  s.ios.resource             = 'ios/BEKit.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'ios/BEKit.framework'
end

#
#  Be sure to run `pod spec lint RACLogin.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

    s.name         = 'RACLogin'
    s.version      = '0.0.1'
    s.summary      = 'login.'
    s.source_files  = 'RACLogin/Classes/*.{h,m}'
    s.homepage     = "https://github.com/Vickeywei/RACLoginDemo.git/"
    s.license      = "MIT"
    s.author       = { "weiqi" => "weiqi@hzdracom.com" }
    s.source       = { :git => "git@github.com:Vickeywei/RACLoginDemo.git"}
    s.resources = 'RACLogin/Images/*.*'
    s.requires_arc = true
    s.ios.deployment_target = '7.0'
    s.dependency 'ReactiveCocoa', '~> 2.5'
    s.dependency 'AFNetworking', '~> 2.6'
    s.dependency 'MBProgressHUD', '~> 0.9.2'
    s.dependency 'Masonry', '~> 1.0.1'


end

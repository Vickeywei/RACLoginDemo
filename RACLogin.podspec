
Pod::Spec.new do |s|

    s.name         = 'RACLogin'
    s.version      = '0.0.1'
    s.summary      = 'login'
    s.source_files  = 'RACLogin/Classes/*.{h,m}'
    s.homepage     = "https://github.com/Vickeywei/RACLoginDemo"
    s.license      = 'MIT (LICENSE)'
    s.author       = { "weiqi" => "weiqi@hzdracom.com" }
    s.source       = { :git => "https://github.com/Vickeywei/RACLoginDemo.git", :tag => "0.0.1"}
    s.resources = 'RACLogin/Images/*.*'
    s.requires_arc = true
    s.ios.deployment_target = '7.0'
    s.dependency 'ReactiveCocoa', '~> 2.5'
    s.dependency 'AFNetworking', '~> 2.6'
    s.dependency 'MBProgressHUD', '~> 0.9.2'
    s.dependency 'Masonry', '~> 1.0.1'
    s.frameworks = 'UIKit', 'Foundation'

end

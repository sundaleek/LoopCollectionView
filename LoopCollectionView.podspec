Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "LoopCollectionView"
s.summary = "Infinite Collection View"
s.requires_arc = true
s.version = "0.1.2"
s.license = { :type => "Apache", :file => "LICENSE" }
s.author = { "David Ozmanyan" => "dmozmanyan@gmail.com" }
s.homepage = "https://github.com/sundaleek/LoopCollectionView"
s.source = { :git => "https://github.com/sundaleek/LoopCollectionView.git",
             :tag => "#{s.version}" }
s.framework = "UIKit"
s.source_files = "LoopCollectionView/**/*.{swift}"
s.resources = "LoopCollectionView/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
s.swift_version = "5.0"

end

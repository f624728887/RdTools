Pod::Spec.new do |s|

  s.name         = "RdTools"
  s.version      = "0.1.9"
  s.summary      = "It is my layout file base on Masonry."

  s.authors     = { 'Rondo' => 'f624728887@163.com' }

  s.homepage     = "https://github.com/f624728887/RdTools"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.platform = :ios, '9.0'
  s.requires_arc = true

  s.source       = { :git => "https://github.com/f624728887/RdTools.git", :tag => s.version.to_s }
  s.source_files  = "RdToolsProject/RdTools/*.{h,m}"

  s.framework  = "UIKit", "Foundation"
  s.dependency "Masonry"
  s.dependency "SDWebImage"

end

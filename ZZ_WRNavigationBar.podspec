
Pod::Spec.new do |s|

  s.name         = "ZZ_WRNavigationBar"
  s.version      = "1.2.0"
  s.summary      = "navigationBar statusBar alpha color(zz：将导航栏加背景图片渐变，导航栏完全隐藏)"
  s.homepage     = "https://github.com/pengzz/WRNavigationBar.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "pzz1284" => "pzz1284@163.com" }
  s.social_media_url   = "http://weibo.com/wangrui460"
  s.platform     = :ios, "8.0"
 #s.source       = { :git => "https://github.com/wangrui460/WRNavigationBar.git", :tag => s.version }
  s.source       = { :git => "https://github.com/pengzz/WRNavigationBar.git", :branch => "pzz" :tag => s.version }
  s.source_files  = "WRNavigationBar/*.{h,m}"
  s.requires_arc         = true

end

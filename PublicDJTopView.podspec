Pod::Spec.new do |s|
  s.name         = "PublicDJTopView" # 项目名称
  s.version      = "0.1.2"        # 版本号 与 你仓库的 标签号 对应
  s.license      = "MIT"          # 开源证书
  s.summary      = "A delightful TextField of PhoneNumber" # 项目简介

  s.homepage     = "https://github.com/domjeck/PublicDJTopView" # 你的主页
  s.source       = { :git => "https://github.com/domjeck/PublicDJTopView.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
  s.source_files = "PublicDJTopView/**/*" # 你代码的位置
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "7.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  # s.dependency   = "AFNetworking" # 依赖库
  
  # User
  s.author             = { "domjeck" => "121956052@qq.com" } # 作者信息
end
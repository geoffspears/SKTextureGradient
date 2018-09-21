Pod::Spec.new do |s|
s.name         = "SKTextureGradient"
s.version      = "4.0.1"
s.summary      = "SKTexture extension"
s.description  = "Sprite Kit SKTexture Gradient"
s.homepage     = "https://github.com/maximbilan/SKTextureGradient"
s.license      = { :type => "MIT" }
s.author       = { "Maxim Bilan" => "maximb.mail@gmail.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/maximbilan/SKTextureGradient.git", :tag => s.version.to_s }
s.source_files = "Source", "*.{swift}"
s.requires_arc = true
end

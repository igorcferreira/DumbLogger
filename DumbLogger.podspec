Pod::Spec.new do |s|


  s.name         = "DumbLogger"
  s.version      = "0.0.2"
  s.platform     = :ios, '8.0'
  s.summary      = "Framework sample created for the CocoaHeads Conference on Brazil"

  s.dependency 'AFNetworking'
  #s.ios.frameworks  = 'MobileCoreServices'
  #s.frameworks   = 'SystemConfiguration'

  s.description  = <<-DESC
  Simple sample created to show the problems that you can face when creating frameworks.
                   This project was made to be used on a workshop on the CocoaHeads Brasil Conference (http://cocoaheadsconference.com.br/)
                   DESC

  s.homepage     = "https://github.com/igorcferreira/DumbLogger"
  s.license      = { :type => 'Apache License Version 2.0', :file => 'LICENSE' }
  s.author       = { "Igor Ferreira" => "igorcferreira@hotmail.com" }

  s.source       = { :git => "https://github.com/igorcferreira/DumbLogger.git", :tag => s.version }

  s.source_files  = 'Source Files/**/*.{h,m}'
  s.public_header_files = 'Source Files/*.h'
  s.module_name = 'DumbLogger'
  s.requires_arc = false
  s.resources = ['Support Files/en.lproj/*.strings','Support Files/pt.lproj/*.strings']

end

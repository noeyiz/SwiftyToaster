Pod::Spec.new do |s|
  s.name         = 'SwiftyToaster'
  s.version      = '1.0.1'
  s.summary      = '🍞 Toaster for Swift'
  s.description  = 'A simple and effective toast message library for Swift!'
  s.homepage     = 'https://github.com/noeyiz/SwiftyToaster'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'noeyiz' => 'goojiong@gmail.com' }
  s.source       = { :git => 'https://github.com/noeyiz/SwiftyToaster.git',
                     :tag => "#{s.version}" }
  s.platform     = :ios, '13.0'
  s.source_files = 'Sources/*.swift'
  s.swift_version = '5.0'
end

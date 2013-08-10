Pod::Spec.new do |s|
  s.name         = 'RUCanvasView'
  s.version      = '0.0.1'
  s.summary      = 'Lightweight implementation for drawing on iOS.'
  s.homepage     = 'https://github.com/rauluranga/RUCanvasView'
  s.license      = { :type => 'MIT', :file => 'license.txt' }
  s.author = {
    'Raul Uranga' => 'ruranga@gmail.com'
  }
  s.source = {
    :git => 'https://github.com/rauluranga/RUCanvasView.git',
    :tag => '0.0.1'
  }
  s.platform     = :ios, '5.0'
  s.source_files = 'Source/*.{h,m}'
  s.exclude_files = 'RUCanvasViewTest'
  s.requires_arc = true
end
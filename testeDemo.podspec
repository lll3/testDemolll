Pod::Spec.new do |s|
  s.name = 'testDemo'
  s.version = '1.0.0'

  s.osx.deployment_target = '10.11'
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.license = 'MIT'
  s.summary = 'Asynchronous image downloader with cache support with an UIImageView category.'
  s.homepage = 'https://github.com/lll3/testDemo.git'
  s.author = { 'lll' }
  s.source = { :git => 'https://github.com/lll3/testDemo.git', :tag => s.version.to_s }

  s.description = 'a test demo'

  s.requires_arc = true
  s.source_files = "testDemo/lib/*", "*.{h,m}"

end

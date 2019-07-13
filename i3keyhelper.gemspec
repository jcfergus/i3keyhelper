$:.unshift(File.dirname(__FILE__) + '/lib')
require 'i3keyhelper'

Gem::Specification.new do |s|
  s.name = 'i3keyhelper'
  s.version = I3KeyHelper::VERSION

  s.authors = ["Justin Ferguson"]
  s.email = "jferg@thedotin.net"
  s.description = "i3keyhelper is awesome"
  s.executables = ["i3keyhelper"]
  s.files = %w[Rakefile Gemfile bin/i3keyhelper] +
      Dir['lib/**/*.rb'] +
      Dir['test/**/*.rb']
  s.licenses = ["MIT"]
  s.summary = "Foo"

end

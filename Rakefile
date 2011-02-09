# -*- ruby -*-


require 'rake/clean'
require 'rubygems'
require 'hoe'
require 'ruby-debug'
CLEAN.include %w(**/*.orig)
Hoe.plugins.delete :rubyforge
Hoe.plugin :hg

Hoe.spec 'saintly' do
  developer('Andy Kvamme', 'akvamme@gmail.com')
  developer('Justin Coyne', 'jcoyne@justincoyne.com')
  extra_dev_deps << %w(shoulda >=2.10.0) << %w(mocha >=0.9.8)
end

task :install =>:package do
  $:<< 'lib'
  require 'saintly'
  debugger
  puts `GEM_HOME=~/.gem/ruby/1.8 gem install pkg/saintly-#{Saintly::VERSION}.gem`
end
# vim: syntax=ruby
#

#begin
#  require "rubygems"
#  gem "minitest"
#rescue Gem::LoadError
#  # do nothing
#end

require_relative "../minitest.rb"
require_relative "./spec.rb"
require_relative "./mock.rb"
Minitest.autorun

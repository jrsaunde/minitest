# :stopdoc:

unless defined?(Bigtest) then
  # all of this crap is just to avoid circular requires and is only
  # needed if a user requires "minitest/unit" directly instead of
  # "minitest/autorun", so we also warn

  from = caller.reject { |s| s =~ /rubygems/ }.join("\n  ")
  warn "Warning: you should require 'minitest/autorun' instead."
  warn %(Warning: or add 'gem "minitest"' before 'require "minitest/autorun"')
  warn "From:\n  #{from}"

  module Bigtest; end
  BigTest = Bigtest # prevents minitest.rb from requiring back to us
  require_relative "../minitest.rb"
end

BigTest = Bigtest unless defined?(BigTest)

module Bigtest
  class Unit
    VERSION = Bigtest::VERSION
    class TestCase < Bigtest::Test
      def self.inherited klass # :nodoc:
        from = caller.first
        warn "BigTest::Unit::TestCase is now Bigtest::Test. From #{from}"
        super
      end
    end

    def self.autorun # :nodoc:
      from = caller.first
      warn "BigTest::Unit.autorun is now Bigtest.autorun. From #{from}"
      Bigtest.autorun
    end

    def self.after_tests(&b)
      from = caller.first
      warn "BigTest::Unit.after_tests is now Bigtest.after_run. From #{from}"
      Bigtest.after_run(&b)
    end
  end
end

# :startdoc:

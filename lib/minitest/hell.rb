require_relative "./parallel.rb"

class Minitest::Test
  class << self
    alias :old_test_order :test_order # :nodoc:

    def test_order # :nodoc:
      :parallel
    end
  end
end

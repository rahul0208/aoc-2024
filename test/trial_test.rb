require "test_helper"

require "trial"

class TrialTest < Test::Unit::TestCase
     test "something useful" do
        t= Trial.new
        assert_equal("Hello, world!", t.hello)
    end
  end
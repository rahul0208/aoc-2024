require "test_helper"

require "day3"
require 'csv'

class DayThreeTest < Test::Unit::TestCase
  test "day 3 test" do
    compute =  DayThree.new
    assert_equal(161, compute.findMulIntructions("xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"))   
  end

  test "day 3 test2" do
    compute =  DayThree.new
    assert_equal(0, compute.findMulIntructions("mul(4*, mul(6,9!, ?(12,34), or mul ( 2 , 4 )"))   
  end

  test "day 3 test3 " do
    compute =  DayThree.new
    file = File.open("data/day3.txt")
    sum =0
    file.readlines().each do |line|
        sum +=compute.findMulIntructions(line)        
    end
    assert_equal(104245808,sum)   
  end

  test "day 3 test4" do
    compute =  DayThree.new
    assert_equal(48, compute.findMulIntructions("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"))   
  end
end
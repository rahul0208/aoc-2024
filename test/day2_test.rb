require "test_helper"

require "day2"
require 'csv'

class DayTwoTest < Test::Unit::TestCase
  test "day 2 test" do
    checker =  DayTwo.new
    assert_equal(0, checker.checkReport([7,6,4,2,1]))   
  end

  test "day 2 test 2" do
    checker =  DayTwo.new
    data =[]
    data.append([7,6,4,2,1])
    data.append([1,2,7,8,9])
    data.append([9,7,6,2,1])
    data.append([1,3,2,4,5])
    data.append([8,6,4,4,1])
    data.append([1,3,6,7,9])
    assert_equal(4, checker.classifyReport(data))   
  end  

  test "day 2 test 3" do
    data=CSV.read("data\\day2.csv",converters: %i[numeric date])        
    puts "Day2 d1 #{data.size}"
    puts "Day2  d2 #{data[1]}"    
    checker =  DayTwo.new
    assert_equal(236, checker.classifyReport(data))   
  end


end



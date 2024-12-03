require "test_helper"

require "day1"
require 'csv'

class DayOneTest < Test::Unit::TestCase
  test "day 1 test" do
    distance =  DayOne.new([1, 2],[2]) 
    assert_equal(0, distance.determineDiffTotal)
  end

  test "day 1 test 2" do
    distance =  DayOne.new([3,4,2,1,3,3],[4,3,5,3,9,3]) 
    assert_equal(11, distance.determineDiffTotal)
  end


  test "day 1 test 3" do
    data=CSV.read("data\\day1-1.csv")    
    data1 = []
    data2 = []
    data.each do |e|
      data1.append(e[0].to_i)
      data2.append(e[1].to_i)
    end
    # puts "d1 #{data1.size}"
    # puts "d2 #{data2.size}"    
    distance =  DayOne.new(data1,data2) 
    assert_equal(2066446, distance.determineDiffTotal)
  end

  test "day 1 test 4" do
    distance =  DayOne.new([3,4,2,1,3,3],[4,3,5,3,9,3]) 
    assert_equal(31, distance.determineSimilarityScore)
  end
 
  test "day 1 test 5" do
    data=CSV.read("data\\day1-1.csv")    
    data1 = []
    data2 = []
    data.each do |e|
      data1.append(e[0].to_i)
      data2.append(e[1].to_i)
    end
    # puts "d1 #{data1.size}"
    # puts "d2 #{data2.size}"    
    distance =  DayOne.new(data1,data2) 
    assert_equal(24931009, distance.determineSimilarityScore)
  end
  
end
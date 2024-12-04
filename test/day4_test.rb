require "test_helper"

require "day4"
require 'csv'

class DayFourTest < Test::Unit::TestCase
# test "day 4 test" do    
#     lines = Array.new
#     lines.append('ooXooo'.chars)
#     lines.append('oSAMXo'.chars)
#     lines.append('oAooAo'.chars)
#     lines.append('XMASoS'.chars)
#     lines.append('oXoooo'.chars)
#     compute =  DayFour.new
#     assert_equal(161, compute.determineCount(lines))
#     end
    
  test "day 4 test1" do    
    lines = Array.new
    lines.append('MMMSXXMASM'.chars)
    lines.append('MSAMXMSMSA'.chars)
    lines.append('AMXSXMAAMM'.chars)
    lines.append('MSAMASMSMX'.chars)
    lines.append('XMASAMXAMM'.chars)
    lines.append('XXAMMXXAMA'.chars)
    lines.append('SMSMSASXSS'.chars)
    lines.append('SAXAMASAAA'.chars)
    lines.append('MAMMMXMMMM'.chars)
    lines.append('MXMXAXMASX'.chars)
    # puts lines
    compute =  DayFour.new
    assert_equal(18, compute.determineCount(lines))
  end

  test "day 4 test2 " do    
    file = File.open("data/day4.txt")
    lines = Array.new
    file.readlines().each do |line|
        lines.append(line.chars)    
    end
    compute =  DayFour.new
    assert_equal(2599,compute.determineCount(lines))   
  end

end
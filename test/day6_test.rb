require "test_helper"

require "day6"
require "csv"

class DaySixTest < Test::Unit::TestCase
  test "day6 test1" do
    map = DaySix.new
    map.addMapCoordinates("....#.....")
    map.addMapCoordinates(".........#")
    map.addMapCoordinates("..........")
    map.addMapCoordinates("..#.......")
    map.addMapCoordinates(".......#..")
    map.addMapCoordinates("..........")
    map.addMapCoordinates(".#..^.....")
    map.addMapCoordinates("........#.")
    map.addMapCoordinates("#.........")
    map.addMapCoordinates("......#...")

    status =0
    itr =0
    while status!=2 do 
      # puts("************ move  #{itr}")
      status= map.moveGuard
      # map.print
      itr +=1
    end
    
      assert_equal(41,map.countPos)
      # assert_equal(6,map.obstacle)

  end

  # test "day6 test5" do
  #   map = DaySix.new
  #   map.addMapCoordinates("....#.....")
  #   map.addMapCoordinates(".........#")
  #   map.addMapCoordinates("..........")
  #   map.addMapCoordinates("..#.......")
  #   map.addMapCoordinates(".......#..")
  #   map.addMapCoordinates("..........")
  #   map.addMapCoordinates(".#..^.....")
  #   map.addMapCoordinates("........#.")
  #   map.addMapCoordinates("#.........")
  #   map.addMapCoordinates("......#...")

  #   status =0
  #   itr =0
  #   map.checkObsPlacement(100)  
  #   assert_equal(6,map.obstacle)

  # end


  # test "day 6 test2" do
  #   file = File.open("data/day6.txt")      
  #   map =  DaySix.new
    
  #   file.readlines().each do |line|       
  #     map.addMapCoordinates(line)
  #   end
  #   status =0
  #   itr =0
  #   while status!=2 do 
  #     # puts("************ move  #{itr}")
  #     status= map.moveGuard
  #     # map.print
  #     itr +=1
  #   end
  #   # map.print
  #   puts "its val #{itr}"
  
  #   assert_equal(5453,map.countPos)  
  # end

  # test "day 6 test3" do
  #   file = File.open("data/day6.txt")      
  #   map =  DaySix.new
    
  #   file.readlines().each do |line|       
  #     map.addMapCoordinates(line)
  #   end    
  #   status =0
  #   itr =0
  #   map.checkObsPlacement(7000)  
  #   assert_equal(6,map.obstacle) 
  # end
end

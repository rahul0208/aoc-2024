require "test_helper"

require "day5"
require 'csv'

class DayFiveTest < Test::Unit::TestCase

#   test "day 5 test1" do    
#     puts "tests 5"
#     printer =  DayFive.new
#     printer.addOrderingRule(47,53)
#     printer.addOrderingRule(97,13)
#     printer.addOrderingRule(97,61)
#     printer.addOrderingRule(97,47)
#     printer.addOrderingRule(75,29)
#     printer.addOrderingRule(61,13)
#     printer.addOrderingRule(75,53)
#     printer.addOrderingRule(29,13)
#     printer.addOrderingRule(97,29)
#     printer.addOrderingRule(53,29)
#     printer.addOrderingRule(61,53)
#     printer.addOrderingRule(97,53)
#     printer.addOrderingRule(61,29)
#     printer.addOrderingRule(47,13)
#     printer.addOrderingRule(75,47)
#     printer.addOrderingRule(97,75)
#     printer.addOrderingRule(47,61)
#     printer.addOrderingRule(75,61)
#     printer.addOrderingRule(47,29)
#     printer.addOrderingRule(75,13)
#     printer.addOrderingRule(53,13)

#     assert_true(printer.validateSequence([75,47,61,53,29]))
#     assert_true(printer.validateSequence([97,61,53,29,13]))
#     assert_true(printer.validateSequence([75,29,13]))
#     assert_false(printer.validateSequence([75,97,47,61,53]))
#     assert_false(printer.validateSequence([61,13,29]))
#     assert_false(printer.validateSequence([97,13,75,29,47]))
#     assert_equal(143,printer.aggVal)
#     puts "#{printer.fixSequence([61,13,29])}"
#     puts "#{printer.fixSequence([75,97,47,61,53])}"
#     puts "#{printer.fixSequence([97,13,75,29,47])}"
#     assert_equal(123,printer.aggVal-143)
#   end


  test "day 5 test2" do    
    file = File.open("data/day5.txt")
    isRule= true
    printer =  DayFive.new
    failedSeq = []
    file.readlines().each do |line|
        if line.length < 2
            isRule=false
        else            
            if isRule
                v=line.split('|')
                # puts "#{v}"
                printer.addOrderingRule(v[0].to_i,v[1].to_i) 
            else
                v=line.split(',')                 
                sq=[]
                v.each do |n|
                    sq += [n.to_i]
                end                          
                r = printer.validateSequence(sq)  
                if(r==false)
                    failedSeq.append(sq)
                end

                # puts "#{r} #{sq} "              
            end
        end
    end
    assert_equal(4637,printer.aggVal)   

    failedSeq.each do |fsq|
        printer.fixSequence(fsq)  
    end
    assert_equal(6370,printer.aggVal-4637)
  end

end

class DayOne
    def initialize(loc1,loc2)
        @srcLoc=loc1
        @targetLoc=loc2        
        if (loc1.length()!= loc2.length())
            raise 'length should match'
        end
    end

    def determineDiffTotal
        loc1=@srcLoc.sort()
        loc2=@targetLoc.sort()
        diff= 0;
        pos = 0
        while pos < @srcLoc.size do
         #   puts "Iterate #{pos}"
            diff += (loc1[pos] - loc2[pos]).abs
            pos = pos + 1
        end        
        return diff
    end

    def determineSimilarityScore
        loc1=@srcLoc.sort()
        loc2=@targetLoc.sort()        
        pos = 0
        lookup = 0
        score = 0
        while pos < @srcLoc.size do
         #   puts "Iterate #{pos}"
            count=0;          
            while lookup < @targetLoc.size && loc2[lookup]<=loc1[pos] do
                if (loc1[pos]==loc2[lookup])
                    count = count +1
                end
                lookup = lookup +1
            end
            score += loc1[pos] * count
  #          puts "#{loc1[pos]} * #{count}" 
            pos = pos+1        
            lookup = lookup - count
        end        
        return score
    end
end

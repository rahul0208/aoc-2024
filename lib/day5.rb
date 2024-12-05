class DayFive
    def initialize() 
        @beforOrder = Hash.new  
        @afterOrder = Hash.new  
        for e in 1..99 do 
            @beforOrder[e]=[]
            @afterOrder[e]=[]
        end
    end

    def addOrderingRule(bvar,avar)
        @beforOrder[bvar]=@beforOrder[bvar]+[avar]
        @afterOrder[avar]=@afterOrder[avar]+[bvar]
        @aggregate =0        
    end

    def validateSequence(seq)
        idx =0
        valid = true        
        while idx < seq.length && valid do
            val = seq[idx]
            # bvals = @beforOrder[val]
            avals = @afterOrder[val]
            j=idx
            while j < seq.length && valid do              
                if avals.include?(seq[j])
                    valid=false
                end
                j = j+1
            end
            idx += 1
        end
        # puts "invoking #{valid}"     
        if valid
            @aggregate += seq[seq.length/2]
        end   
        return valid
    end

    def fixSequence(seq)
        modseq=seq
        result= true
        # puts "#{@beforOrder}"  
        # puts "#{@afterOrder}"  
        i =0

        while result != false && i<1000 do
            result,modseq=performMove(modseq)            
            i +=1
        end

        if i==1000
            raise "Error"
        end     
        @aggregate += modseq[modseq.length/2]
        return modseq
        
    end

    def performMove(seq)
        idx =0   
        modseq=seq.clone        
        while idx < seq.length do           
            val = seq[idx]
            # puts "#{val} : #{modseq}"
            # valid = true   
            bvals = @beforOrder[val]
            j=idx+1
            while j < seq.length do              
                if bvals.length ==0 || bvals.include?(seq[j])==false
                    modseq[idx]=seq[j]
                    modseq[j]=val                            
                    return true, modseq 
                end
                j = j+1
            end            
            idx += 1
        end          
        return false, modseq
    end


    def aggVal()
        return @aggregate
    end

end
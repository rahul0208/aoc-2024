class DayThree
    def initialize()
        @state =0
    end

    def findMulIntructions(instrText)
        mutableInst=instrText.clone
        count=0
        agg =0 
        endstate = nil
        captureEndState = false 
        # puts "state #{@state}"
        while match = mutableInst.match('(.*)(mul\(\d{1,3},\d{1,3}\))(.*)') do
            pre, inst, post = match.captures
            # puts inst
            count += 1
            val = compute(inst) 
            state =checkStateInst(pre) 
            if  captureEndState == false
                endstate =state
                # puts "closestate #{state}" 
                captureEndState =true
                # raise "error"
            end          
            # puts "#{inst} #{state}" 
            if state==0
                agg += val
            end
            mutableInst = pre
        end
        # puts "endstate #{endstate}"
        @state =endstate        
        # puts "total count #{count}"
        return agg
    end

    def compute(instrText)
        v1,v2=instrText.match('mul\((\d{1,3}),(\d{1,3}\))').captures 
        return v1.to_i * v2.to_i
    end

    def checkStateInst(enableInst)
        dnotpostlength = -1
        if donotmatch=enableInst.match('.*don\'t\(\)(.*)') 
            text = donotmatch.captures
            dnotpostlength = text[0].length()
            # puts "dnotpostlength #{dnotpostlength} #{text}" 
        end
        dpostlength = -1
        if domatch=enableInst.match('.*do\(\)(.*)') 
            text2 = domatch.captures
            dpostlength = text2[0].length
            # puts "dpostlength #{dpostlength} #{text2}" 
        end       
         

        state = 1
        if dpostlength==-1 &&  dnotpostlength > -1
            state =1
        end
        
        if dnotpostlength==-1 &&  dpostlength > -1
            state =0
        end

        if dpostlength==-1 &&  dnotpostlength == -1
            state = @state
        end

        if dpostlength!=-1 &&  dnotpostlength != -1
            state = 0
            if dpostlength > dnotpostlength
                state=1
            end
        end

        return state
    end
end
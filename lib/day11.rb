class DayEleven
    def initialize(ini)
        @stones=[]
        @refstones=[]
        ini.each do |nos|
            @stones.append(nos.to_i)
        end
        # arry=[1]
        # r=[]    
        # for j in 1..25 do            
        #     sts=blink(arry)
        #     arry=sts 
        #     r.append(sts)
        #     puts "#{j} - #{sts.length}"                              
        # end 
        # r1=r[r.length-1]
        # for j in 25..50 do            
        #     a=r1.select { |n| n != 1 } 
        #     a = a.uniq
        #     sts=blink(a)
        #     r1=sts 
        #     r.append(sts)
        #     puts "#{j} - #{sts.length} -  #{sts.uniq}"                              
        # end 

        
    end

    def blink(sts)
        arry={}
        sts.keys.each do |st|
            v = sts[st]
            if st==0
                if (arry.has_key?(1))
                    arry[1] += v
                else
                    arry[1] = v
                end
            elsif st.to_s.length%2 == 0
                pos= st.to_s.length/2
                nos1=st.to_s[0,pos].to_i
                nos2=st.to_s[pos,st.to_s.length].to_i
                if (arry.has_key?(nos1))
                    arry[nos1] += v
                else
                    arry[nos1] = v
                end
                if (arry.has_key?(nos2))
                    arry[nos2] += v
                else
                    arry[nos2] = v
                end                
            else
                nos = st*2024
                if (arry.has_key?(nos))
                    arry[nos] += v
                else
                    arry[nos] = v
                end
            end                
        end
        return arry
    end

    def blinkCount(nos)
        map={}
        @stones.each do |e|
            if map.has_key?(e)
                map[e] += 1
            else
                map[e] = 1
            end
        end

        for i in 1..nos do
            a=blink(map)
            count= 0
            a.each {|key, value| count+=value }
            puts "#{i}-#{count} {a}"
            map=a
        end
    end

    def stones
        return @stones
    end
end
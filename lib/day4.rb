class DayFour
    def initialize()   
    end

    def determineCount(data)
        rcount=data.length
        ccount=data[0].length
        pos0=falttenHorizontalPositons(rcount,ccount)
        pos1=falttenVerticalPositons(rcount,ccount)
        pos2=falttenDiagnolPositons(rcount,ccount)
        pos3=falttenReverseDiagnolPositons(rcount,ccount)
        sum =0
        hits = Array.new
        pos0.each do |h|
            hcount,hpos =countPattern(data, h, ['X','M','A','S'],[]) 
            # puts "hcount #{hcount}"
            h1count,h1pos=countPattern(data, h, ['S','A','M','X'],[]) 
            # puts "h1count #{h1count}"
            sum += hcount+h1count
            hits += hpos+h1pos
        end

        puts "**** hcount sum #{sum}"

        pos1.each do |v|
            vcount,vpos=countPattern(data, v, ['X','M','A','S'],[]) 
            # puts "vcount #{vcount}"
            v1count,v1pos=countPattern(data, v,  ['S','A','M','X'],[]) 
            # puts "v1count #{v1count}"
            sum += vcount+v1count
            hits += vpos+v1pos
        end

        puts "**** vcount sum #{sum}"

        dhits =[]
        puts "**** paths count  #{pos2.length}"

        dindex =0

        pos2.each do |d1|
            puts "dx-#{dindex} #{d1.size}"            
            dcount,dpos=countPattern(data, d1, ['X','M','A','S'],dhits) 
            #  puts "dcount #{dcount}"
            
            d1count,d1pos=countPattern(data, d1, ['S','A','M','X'],dhits) 
            #  puts "d1count #{d1count}"
            sum += dcount+d1count
            dhits += dpos+d1pos
            dindex += 1
            
        end
        hits += dhits

        puts "**** dcount sum #{sum}"
        # print dhits
        rdhits =[]

        pos3.each do |d2|
            rdcount,rdpos=countPattern(data, d2, ['X','M','A','S'],rdhits) 
            # puts "rdcount #{rdcount}"
            # print d2
            rd1count,rd1pos=countPattern(data, d2, ['S','A','M','X'],rdhits) 
            # puts "rd1count #{rd1count}"
            sum += rdcount+rd1count
            rdhits += rdpos+rd1pos
        end   
        hits += rdhits  
        
        puts "**** rdcount sum #{sum}"
        # puts "**** hits #{hits}"

    
        i=0
        while i < rcount do
            j = 0
            while j < ccount do
               miss=true
               hits.each do |e|
                 if e[0] == i && e[1]==j
                    miss=false 
                 end
                end
               if miss 
                    print "."
               else
                    print data[i][j]
               end
                j=j+1                
            end
            i =i+1
            puts ""
        end       
       
        return sum 
    end
    
    def countPattern(data, poslist, pattern, foundLocations)
        l=0
        plen=pattern.length
        count =0
        hitpos= Array.new
        while l <= poslist.length-plen do
            j=0
            status=true
            foundLocations.each do |e|                            
                if e[0]==poslist[l][0] && e[1]==poslist[l][1]
                    # puts "location alrady exits "
                    status=false
                end
            end

            while j < plen && status==true do
                x=poslist[l+j][0]
                y=poslist[l+j][1]
                # if(poslist[l][0]=6 && poslist[l][1]=0)
                #     print data[x][y]
                # end
                status = status && (data[x][y]==pattern[j])
                j=j+1
            end
            if status==true
                k=0
                while k < plen do
                    hitpos.append(poslist[l+k])
                    k += 1
                end
                count += 1
            end
            l=l+1
        end
        return count, hitpos
    end


    def falttenHorizontalPositons(rowsize,colsize)
        mpos = Array.new
        i=0
        while i < rowsize do
            pos = Array.new
            j = 0
            while j < colsize do
                pos.append([i,j])
                j=j+1                
            end
            i =i+1
            mpos.append(pos)
        end       
        return mpos       
    end

    def falttenVerticalPositons(rowsize,colsize)
        mpos = Array.new
        i=0
        while i < colsize do
            pos = Array.new
            j = 0
            while j < rowsize do
                pos.append([j,i])
                j=j+1                
            end
            i =i+1
            mpos.append(pos)
        end
        return mpos              
    end

    def falttenDiagnolPositons(rowsize,colsize)
        mpos = Array.new
        i=0
        while i < rowsize do            
            j = 0
            while j < colsize do
                pos = Array.new
                x=i
                y=j
                while x < rowsize && y < colsize do
                    pos.append([x,y])
                    x=x+1
                    y=y+1
                end                
                j=j+1
                mpos.append(pos)
            end
            i =i+1            
        end       
        return mpos      
    end

    def falttenReverseDiagnolPositons(rowsize,colsize)
        mpos = Array.new
        i=0
        while i < rowsize do            
            j = 0
            while j < colsize do
                pos = Array.new
                x=i
                y=j
                while x < rowsize && y >= 0 do
                    pos.append([x,y])
                    x=x+1
                    y=y-1
                end                
                j=j+1
                mpos.append(pos)
            end
            i =i+1            
        end       
        return mpos   
    end

end
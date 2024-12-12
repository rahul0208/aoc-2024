class DayTwelve
    def initialize()
    end

    def crops(lines)
        r=[]
        ids=[]
        lines.each do |l|
            cr=l.chomp
            r.append(cr.chars)
            ids.append(Array.new(cr.chars.length,""))
        end

        matrix =[]
        map={}
        i=0
        while i < r.length do
            j=0            
            while j < r[i].length do
                p = i*r[0].length+j                
                val=[]     
                pos=[]
                if i==0 || r[i][j]!=r[i-1][j]
                    val.append(1)  
                else             
                    val.append(0)
                end
                if i==r[i].length-1 || r[i][j]!=r[i+1][j]  
                    val.append(1)
                else
                    val.append(0)
                end
                if j==0 || r[i][j]!=r[i][j-1]
                    val.append(1)
                else
                    val.append(0)
                end
                if j== r[i].length-1 || r[i][j]!=r[i][j+1]
                    val.append(1)
                else
                    val.append(0)
                end
                matrix.append(val)
                j+=1
            end            
            i += 1
         end

         grps=[]
         i=0
         while i < r.length do
             j=0            
             while j < r[i].length do
                valChecked = false
                t =0
                while t < grps.length && !valChecked do
                    valChecked=grps[t].include?([i,j])  
                    t += 1
                end
                if !valChecked
                    l=cropsfarm(i,j, r)
                    grps.append(l)
                end
                j += 1
             end
             i +=1
        end

        compute =0
        grps.each do |g|
            up =0
            down =0
            x=0
            while x < r.length do
                upstate=false
                downstate=false
                y=0
                while y < r[x].length do
                    pos = x*r[0].length+y
                    test=g.include?([x,y]) 
                    if test && !upstate && matrix[pos][0]==1
                        upstate=true
                        up += matrix[pos][0]                        
                    end
                    if test && !downstate && matrix[pos][1]==1
                        downstate=true
                        down += matrix[pos][1]                        
                    end
                    if test && upstate && matrix[pos][0]==0
                        upstate=false
                        up += matrix[pos][0]                        
                    end
                    if test && downstate && matrix[pos][1]==0
                        downstate=false
                        down += matrix[pos][1]                        
                    end
                    if !test && upstate
                        upstate=false
                    end
                    if !test && downstate
                        downstate=false
                    end
                    y=y+1
                end
                # puts "#{x}- U #{up} - D #{down}"
                x=x+1
            end
            left = 0
            right = 0
            j=0
            while j < r[0].length do
                lstate=false
                rstate=false
                k=0
                while k < r.length do
                    pos = k*r[0].length+j
                    test=g.include?([k,j]) 
                    if test && !lstate && matrix[pos][2] ==1
                        lstate=true
                        left += matrix[pos][2]                      
                    end
                    if test && !rstate && matrix[pos][3] ==1
                        rstate=true
                        right += matrix[pos][3]                      
                    end
                    if test && lstate && matrix[pos][2] ==0
                        lstate=false
                        left += matrix[pos][2]                      
                    end
                    if test && rstate && matrix[pos][3] ==0
                        rstate=false
                        right += matrix[pos][3]                      
                    end
                    if !test && lstate
                        lstate=false
                    end
                    if !test && rstate
                        rstate=false
                    end
                    k=k+1
                end
                j=j+1
            end
            total = up+down+left+right
            p1=g[0][0]
            p2=g[0][1]
            # puts "sides #{r[p1][p2]} #{total} - #{up} #{down} #{left} #{right}"
            compute += total*g.length
        end

        
        #  puts "#{grps}"    
         total =0
         grps.each do |g|
            area = g.length
            peri =0
            g.each do |c|
                p = c[0]*r[0].length+c[1]  
                matrix[p].each do |v|
                    peri  += v
                end
            end
            total += area*peri
         end   
         return compute       
    end

    def cropsfarm(px,py, matx)                
        hike=[]
        chk = [[px,py]]
        i = 0
        len = chk.length
        while i < len do
            x =chk[i][0]
            y =chk[i][1]
            wt = matx[x][y] 
            pos = x*matx[0].length+y 
            if x > 0 && wt == matx[x-1][y]  
                if !chk.include?([x-1,y])                 
                    chk.append([x-1,y])
                end
            end
            if x < matx.length-1 && wt == matx[x+1][y]
                if !chk.include?([x+1,y])
                    chk.append([x+1,y]) 
                end              
            end
            if y > 0 && wt == matx[x][y-1]                 
                if !chk.include?([x,y-1])
                    chk.append([x,y-1])
                end                
            end
            if y < matx[0].length-1 && wt == matx[x][y+1]                   
                if !chk.include?([x,y+1])
                    chk.append([x,y+1])    
                end            
            end
            # if wt==9               
            #     hike.append(pos)
            # end
            i += 1
            len = chk.length
        end
        return chk
    end
end
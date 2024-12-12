require 'matrix'

class DayTen
    def initialize
    end

    def locations(positions)
        matx =[]
        totolpos = 0
        positions.each do |p|
            row = []
            p = p.chomp
            p.chars.each do |sc|
                row.append(sc.to_i)
                totolpos += 1
            end
            matx.append(row)
        end

        totolpos = matx.length*matx[0].length
        
        # puts "#{totolpos} #{matx}"
        
        i =0
        t=0
        while i < matx.length do
            j = 0
            while j < matx[0].length do
                wt = matx[i][j]
                if wt ==0
                    h=trail(i,j, matx)
                    # puts "#{i}-#{j} - #{h.size}"
                    t += h.size
                end
                
                j += 1
            end
            i += 1
        end   
        return t
        
    end

    def trail (px,py, matx)                
        hike=[]
        chk = [[px,py]]
        i = 0
        len = chk.length
        while i < len do
            x =chk[i][0]
            y =chk[i][1]
            wt = matx[x][y] 
            pos = x*matx[0].length+y 
            if x > 0 && wt == matx[x-1][y]-1                   
                chk.append([x-1,y])
            end
            if x < matx.length-1 && wt == matx[x+1][y]-1
                chk.append([x+1,y])               
            end
            if y > 0 && wt == matx[x][y-1]-1                 
                chk.append([x,y-1])                
            end
            if y < matx[0].length-1 && wt == matx[x][y+1]-1                   
                chk.append([x,y+1])                
            end
            if wt==9               
                hike.append(pos)
            end
            i += 1
            len = chk.length
        end
        return hike
    end
end
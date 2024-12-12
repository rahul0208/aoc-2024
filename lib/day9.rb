class DayNine
    def initialize
    end

    def disk(locs)
        fid=0
        pos=1 
        data =[]
        locs.chars do |c|
            i =0
            space = (pos % 2 ==0) 
            while i < c.to_i do
                if space
                    data.append(-1) 
                else
                   data.append(fid)
                end
                i += 1
            end
            pos +=1
            if !space
                fid += 1
            end 
        end
        # puts "Initial data #{data}"

        fileId= fid-1

        endpos=data.length-1
        while fileId > 0 do
            i=0
            stfile=-1
            endfile=-1
            while i < data.length  do 
                cd=data[i] == fileId                
                if cd
                    if stfile == -1
                        stfile=i
                    else
                        endfile=i
                    end
                end
                i += 1
            end
            
            if endfile == -1
                endfile=stfile
            end

            flblock = (endfile -stfile) +1

            # puts "fid #{fileId} sz #{flblock} #{endfile} #{stfile}"

            stpos=0
            blksize = -1
            exchange = false
            while !exchange && stpos < stfile do
                if data[stpos] == -1
                    stblock=stpos
                    while(data[stblock]==-1 && stblock< data.length)
                        stblock +=1
                    end
                    blksize=(stblock-stpos)+1                                  
                end

                if blksize > flblock
                    # puts "blobk sz #{blksize} #{stblock} #{stpos}"
                    ridx=0
                    while ridx < flblock do
                        data[stpos+ridx]=fileId
                        data[endfile-ridx]=-1
                        ridx+=1
                    end
                    exchange = true
                else
                    stpos+=1
                end
            end
            fileId -= 1
            #  puts "moved data : #{data}"

        end            
      
        #  puts "moved data : #{data}"

         checksum =0

         for idx in 0..data.length-1 do
            if data[idx] > 0
                checksum += data[idx]*idx
            end
         end

         return checksum
    
    end

    

end  
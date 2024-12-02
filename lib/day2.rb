class DayTwo

    def classifyReport(allData)
        safe = 0
        allData.each do |e|
            status=checkReport(e)
            if status ==0 
                safe= safe+1
            end
            if status !=0
                cpos=0
                while cpos < e.size do
                    copy=e.clone
                    copy.delete_at(cpos)
                    # puts copy
                    status1=checkReport(copy)
                    if status1 ==0 
                        safe= safe+1
                        break
                     end
                    cpos=cpos+1
                end
            end
        end
        return safe
    end 

   
    def checkReport(rData)
        direction = rData[1]-rData[0]
        if (direction > 3 || direction < -3 || direction == 0)
            return 1
        end
        pos = 2
        while (pos < rData.size) do
            diff = rData[pos] - rData[pos-1]
            pos  = pos+1
            if ( (direction * diff ) < 0)
                # puts direction 
                # puts diff
                return 2
            end
            if (diff > 3 || diff < -3 || diff == 0)
                return 3
            end
        end
        return 0        
    end
end

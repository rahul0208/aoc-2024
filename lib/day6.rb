class DaySix
  def initialize
    @maparea = []
    @grow = -1
    @gcol = -1
    @obsCount =0
  end

  def addMapCoordinates(line)
    row = []
    line.chars.each do |c|
      item = 0
      if c == "#"
        item = -1
      end
      if c == "^"
        item = 1
        @grow = @maparea.length
        @gcol = row.length
      end
      if c == "." || c == "#" ||c == "^"
        row.append(item)
      end
      
    end
    @maparea.append(row)
  end

  def moveGuard
    val = @maparea[@grow][@gcol]
    nrow = -1
    ncol = -1
    if val == 1
      nrow = @grow - 1
      ncol = @gcol
    end
    if val == 2
      nrow = @grow
      ncol = @gcol + 1
    end
    if val == 3
      nrow = @grow + 1
      ncol = @gcol
    end
    if val == 4
      nrow = @grow
      ncol = @gcol - 1
    end
    # puts "status : #{val}, #{@grow}:#{@gcol}"
    status = validateMove(nrow, ncol)
    # puts "status : #{status}, #{nrow}:#{ncol} #{@maparea[nrow][ncol]}"
    if status == 1
      val = (val + 1) % 4
      val = val==0 ? 4: val
      @maparea[@grow][@gcol] = val
    end    
    if status == 0       
      @maparea[nrow][ncol] = val
      @grow = nrow
      @gcol = ncol
    end
    status
  end

  def validateMove(nrow, ncol)
    if (nrow < 0 || nrow >= @maparea.length) || (ncol < 0 || ncol >= @maparea[0].length)
      return 2
    end
    if @maparea[nrow][ncol] == -1
      return 1
    end 
    return 0
  end

  def print
    puts "#{@maparea.length}, #{@maparea[0].length}:"
    @maparea.each do |r|     
        puts "#{r}"
    end
  end
   
  def copy(mapping)
    c = []
    x=0
    mapping.each do |e|
      c.append(e.clone)
    end
    return c
  end

  def checkObsPlacement(maxIter)
    mapCopy=copy(@maparea)
    startx= @grow
    starty=@gcol
    @obsCount =0

    x=0
    while x < mapCopy.length do
      y=0
      while y < mapCopy[0].length do
        if mapCopy[x][y]==0
          @maparea=copy(mapCopy)
          @grow=startx.clone
          @gcol=starty.clone
          @maparea[x][y] =-1
          # puts "Check for #{x} #{y}"          
          llimit=0
          status =0
          while(llimit < 2*maxIter) && status!=2 do
            status= moveGuard
            llimit=llimit+1
          end
          # puts "llimit #{llimit}"
          if status!=2
            # puts "llimit #{llimit}"
            @obsCount += 1
          end
        end
        y += 1
      end
      x +=1
    end    
  end

  def obstacle
    return @obsCount
  end

  def countPos
    pos=0
    @maparea.each do |r|     
        r.each do |c|
            if c > 0
                pos +=1
            end
        end
    end
    return pos
  end
end

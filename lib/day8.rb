class DayEight
  def initialize
    @agg ={}
    @sizex =0
    @sizey =0
    @antena ={}
  end

  def antena(map)
    antena={}
    x=0
    map.each do |row|
      col= row.chars
      y=0
      col.each do |c|
        if c!='.' && c!='\n' 
         if !antena.has_key?(c)
          antena[c]=[]
         end 
          antena[c].append([x,y])
        end
        y += 1
      end
      x += 1
      @sizey=y
    end
    @sizex=x
    antena.delete("\n")

    # puts "#{antena}"
    # puts "#{@sizex} #{@sizey}"
    @antena = antena

  end

  def determineAntidote()
    aid=@antena.keys
    # puts "keys #{aid}"
    aid.each do |akey|
      aloc = @antena[akey]
      i=0
      while (i < aloc.length) do
        j = i+1
        while j< aloc.length do
          #  puts "key #{akey}  p0 #{aloc[i]} p1 #{aloc[j]}"
           hasantidote(aloc[i],aloc[j])
          j += 1
        end
        i += 1
      end
    end
    # puts "agg keys #{@agg.keys()}"
    return @agg
  end

  def hasantidote(p1,p2)
    slope = (p2[1]-p1[1]).to_f/(p2[0]-p1[0]).to_f
    px = 0
    # puts "hasANti #{slope}"
    ycords =[]
    for idxy in 0..@sizey-1 do
      ycords.append(idxy.to_f)
    end
    # puts "#{ycords}"
    # while px < p1[0] do
    #   py = slope * (px-p1[0])+p1[1]
    #   val= ycords.include? py
    #   #  puts "x-#{px} y-#{py}"
    #   if val == true
    #     # puts "x-#{px} y-#{py}"
    #     diffx1=(p1[0]-px).abs
    #     diffx2=(p2[0]-px).abs
    #     diffy1=(p1[1]-py).abs
    #     diffy2=(p2[1]-py).abs
    #     # if 2*diffx1==diffx2 && 2*diffy1==diffy2
    #       #  puts "x-#{px} y-#{py}"
    #        @agg["x-#{px} y-#{py}"] =1
    #     # end
    #   end
    #   px += 1 
    # end
    px = 0
    while px < @sizex do
      py = slope* (px-p1[0])+p1[1]
      val= ycords.include? py
      if val == true
        # puts "x-#{px} y-#{py}"
        diffx1=(p1[0]-px).abs
        diffx2=(p2[0]-px).abs
        diffy1=(p1[1]-py).abs
        diffy2=(p2[1]-py).abs
        # if diffx1==2*diffx2 && diffy1==2*diffy2
          #  puts "x-#{px} y-#{py}"
           @agg["x-#{px} y-#{py}"] =1
        # end
      end
      px += 1 
    end
    return @agg
  end

end
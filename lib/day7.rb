class DaySeven
  def initialize
    @agg =0
  end

  def grid(mcol)
    g = [[]]
    i =0 
    while i < mcol
      v = []
      g.each do |e|
         e1= [0]+e
         v.append(e1)

         e2= [1]+e
         v.append(e2)

         e3= [2]+e
         v.append(e3)

      end
     
      i += 1
      g = v
    end
    # puts " aaaa #{g}"
    return g
  end

  def calibrate(inp)
    d = inp.split(':')
    ops = d[1].split(' ') 
    nos =[]
    r = d[0].to_i
    ops.each do |o|
      nos.append(o.to_i)
    end
    # puts "#{nos}"

    max=nos.size() -1
    opsgrid=grid(max)
    # all = 2 ** max
    i=0
    vals = []
    while i < opsgrid.length do
      # s= "%0#{max}b" % i 
      s = opsgrid[i]
      t = generate(s, nos)
      vals.append(t)
      i = i+1
    end
    ext = false
    vn = 0
    while !ext && vn < vals.length do
      ext = vals[vn] == r
      vn += 1
    end
    if ext
      @agg += r
    end
    # puts "#{vals}"
    return ext
  end

  def generate(sgrid, nos)
    idx =0
    t = nos[0]
    while idx < sgrid.length do
    # str.chars do |c|
      if sgrid[idx]==0
        t = t+nos[idx+1]
      end
      if sgrid[idx]==1
        t = t*nos[idx+1]
      end
      if sgrid[idx]==2
        t = "#{t}#{nos[idx+1]}".to_i
      end
      idx += 1
      
    end 
    return t
  end

  def total
    return @agg
  end

end

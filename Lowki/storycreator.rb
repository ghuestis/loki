def home_titles(nsalgs, quary)
  p nsalgs
  p quary
  
  #if the additional variables are not used, there is effectively zero loss rate for passing additional information to NS
  quary.each do |row|
    i = 0
    start = Time.now.to_i
    while i < 1000000
      normalize(row['address'])
      i=i+1
    end
    finish = Time.now.to_i
    hold = finish - start
    p "1: #{finish - start}"
    i = 0
    start = Time.now.to_i
    while i < 1000000
      nameswap(row['address'], quary, nsalgs)
      i=i+1
    end
    finish = Time.now.to_i
    p "2: #{finish - start}"
    p "1: #{hold}"
    wait = gets.chomp
  end
end

def testfile_sc(nsalgs, quary)
  p nsalgs
  p quary
  cleantable = Array.new
  quary.each do |line|
    p line
    cleanhash = Hash.new
    line.each do |key, value|
      if(nsalgs[key])
        p "#{nsalgs[key]} => #{key} => #{eval("#{nsalgs[key]}(#{value})")}"
      else
        p "#{key} = NOPE!"
      end
    wait = gets.chomp
    end
  end
  return quary
end

def sc_1466(nsalgs, quary)
  p nsalgs
  p quary
end
  

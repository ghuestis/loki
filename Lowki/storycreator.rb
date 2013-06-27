def home_titles(nsalgs, quary)
  p nsalgs
  p quary
  
  #if the additional variables are not used, there is effectively zero loss rate for passing additional information to NS
  
  #yup.  Hence why discarding context is completely unnecessary.  Variables are passed as references, which are basically just
  #pointers to the memory location containing their data.  They're very light, and if there's a possibility they might be needed
  #there's no reason not to send them along.  We can also load totally separate datasets as reference materials if they're needed,
  #as long as we do it in the 'sc_algo' portion so it only gets loaded once.  I'll try to remember to put up an example of that
  #tomorrow.  -G
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
        if (nsalgs[key] =~ /\;|system|\(|\)|drop/)
          abort("nice try, MacGuyver.")
        end
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
  cleantable = Array.new
  quary.each do |line|
    p line
    cleanhash = Hash.new
    line.each do |key, value|
      if(nsalgs[key])
        if (nsalgs[key] =~ /\;|system|\(|\)|drop/)
          abort("nice try, MacGuyver.")
        end
        p nsalgs[key]
        p "#{nsalgs[key]} => #{key} => #{eval("#{nsalgs[key]}(#{value})")}"
      else
        p "#{key} = NOPE!"
      end
    wait = gets.chomp
    end
  end
  return quary
end
  

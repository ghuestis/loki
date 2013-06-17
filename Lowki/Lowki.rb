require 'mysql2'
require_relative('./storycreator.rb')
require_relative('./data_sanitation.rb')

class Targetfile
  include Enumerable
  
  attr_accessor :inputfile, :headers, :input_array
  
  def initialize(file)
    if file =~ /\n/
      @inputfile = StringIO.new(file)
    else
      puts Dir.pwd
      @input_array = false
      @inputfile = File.open(file, 'r')
    end
  end
  
  def get_headers
    @inputfile.rewind
    @input_array = Array.new
    @headers = inputfile.first.chomp.split(/\t/)
    @inputfile.each do |line|
      self.assign_row(line)
    end
  end
  
  def assign_row(line)
    row_array = line.chomp.encode!('UTF-8', 'UTF-8', :invalid => :replace).split(/\t/)
    @input_array << Hash[ @headers.zip(row_array) ]
  end

  def send_build
    @input_array || self.get_headers
  end

  def each
    self.send_build.each {|row| yield row}
  end

end

class Rules
    attr_reader :server, :user, :pass, :database, :table, :last_id, :headers, :nsalgs, :scalg
  def initialize (file)
    File.open("./lokirules/#{file}", 'r') do |contents|
      @server = contents.readline.sub(/.*=>\s*/, '').chomp
      @user = contents.readline.sub(/.*=>\s*/, '').chomp
      @pass = contents.readline.sub(/.*=>\s*/, '').chomp
      @database = contents.readline.sub(/.*=>\s*/, '').chomp
      @table = contents.readline.sub(/.*=>\s*/, '').chomp
      @last_id = contents.readline.sub(/.*=>\s*/, '').chomp.to_i
      @headers = contents.readline.sub(/.*=>\s*/, '').chomp.split(/\s*,\s*/)
      @nsalgs = contents.readline.sub(/.*=>\s*/, '').chomp.split(/\s*,\s*/)
      @scalg = contents.readline.sub(/.*=>\s*/, '').chomp
    end
  end
end

def loadloki (input)
  law = Rules.new("#{input}_rules.txt")  #reads the rules associated with this file
  client = Mysql2::Client.new(:host => law.server, :username => law.user, :password => law.pass)
  client.query("USE #{law.database}")
  quary = client.query("SELECT * FROM #{law.table} WHERE id > #{law.last_id}")
  if (law.scalg =~ /\;/)
    abort("nice try, MacGuyver.")
  end
  nsalgs = Hash[ law.headers.zip(law.nsalgs) ]
  p "scalg: #{law.scalg}"
  cleantable = eval("#{law.scalg}(nsalgs, quary)")
end




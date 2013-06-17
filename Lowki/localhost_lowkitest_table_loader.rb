require 'mysql2'
require_relative('./storycreator.rb')
require_relative('./data_sanitation.rb')
require_relative('./Lowki.rb')


def table_loader

  directory = Dir.glob("**/*");
  slot = 0;
  
  p "file to load(#):"
  directory.each do |option|
    p "#{slot}: #{option}"
    slot = slot + 1
  end
  filez = directory[gets.chomp.to_i];
  
  
  File.open(filez) do |file|
  
    target = Targetfile.new(file)
    
    target.get_headers
    
    p target.headers
    
    depth = Hash.new(0)
    
    target.each do |line|
      target.headers.each do |header|
        depth[header] = line[header].length if line[header].length > depth[header]
      end
    end
    
    query = ''
    
    depth.each do |key, value|
      while value%10 != 0
        value = value + 1
      end
      
      if key == 'id'
        query = query + ", #{key} INT"
      else
        query = query + ", #{key} VARCHAR(#{value})"
      end
    end
    
    query = "CREATE TABLE #{filez.sub(/(\.txt|\.tsv)\s*$/, '')}(#{query.sub(/^,\s*/, '')})";
    
    client = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => 'lorik667m8')
    client.query("USE lowkitest")
    client.query("#{query}")
    
    query1 = ''
    query2 = ''
    
    target.each do |line|
      target.headers.each do |header|
        query1 = query1 + ", #{header}"
        if header == 'id'
          query2 = query2 + ", #{line[header]}"
        else
          query2 = query2 + ", \"#{line[header]}\""
        end
      end
      
      query1 = query1.sub(/^,\s*/, '')
      query2 = query2.sub(/^,\s*/, '')
      
      p "INSERT INTO #{filez.sub(/(\.txt|\.tsv)\s*$/, '')} (#{query1}) VALUES (#{query2})"
      client.query("INSERT INTO #{filez.sub(/(\.txt|\.tsv)\s*$/, '')} (#{query1}) VALUES (#{query2})")
      query1 = ''
      query2 = ''
    end
  end
end

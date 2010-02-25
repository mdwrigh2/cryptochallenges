def test string
  if string.include?"include"
    puts string
    puts "Probably C!"
    output = File.open("decrypted.txt","w")
    output.puts(string)
    output.close
  end
  
  if string.include?"import"
    puts string
    puts "Probably Java!"
    output = File.open("decrypted.txt","w")
    output.puts(string)
    output.close
  end
  
  if string.include?"require"
    puts string
    puts "Probably ruby!"
    output = File.open("decrypted.txt","w")
    output.puts(string)
    output.close
  end
  
end

input = File.read("EncryptedProcessEasy.txt")
array = Array.new

input.split(/\s/).each do |char|
  hexchar = char.hex
  hexchar = (hexchar)
  array.push(hexchar.chr)
end
string = array.to_s
puts string
keyspace = Array.new
('A'..'Z').to_a.to_s.each_byte do |byte|
  keyspace.push(byte)
end

('a'..'z').to_a.to_s.each_byte do |byte|
  keyspace.push(byte)
end
total = 52*52*52*52
j = 0
keyspace.each do |cipher1|
  keyspace.each do |cipher2|
    keyspace.each do |cipher3|
      keyspace.each do |cipher4|
        i=0
        puts "On substitution #{j} of #{total}"
        array = [cipher1, cipher2, cipher3, cipher4]
        newstring = Array.new
        string.each_byte do |byte|
          newstring.push((byte+array[i%4]).chr)
          i = (i+1)
        end
        j = j+1
        test newstring.to_s
      end
    end
  end
end

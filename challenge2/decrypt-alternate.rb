def test string, array
  if string.include?"include"
    puts string
    puts "Probably C!"
    output = File.open("decrypted-alternate.txt","w")
    output.puts("#{array[0]}\t#{array[0].chr}\n#{array[1]}\t#{array[1].chr}\n#{array[2]}\t#{array[2].chr}\n#{array[3]}\t#{array[3].chr}\n\n\n#{string}")
    output.close
  end
  
  if string.include?"import"
    puts string
    puts "Probably Java!"
    output = File.open("decrypted-alternate.txt","w")
    output.puts("#{array[0]}\t#{array[0].chr}\n#{array[1]}\t#{array[1].chr}\n#{array[2]}\t#{array[2].chr}\n#{array[3]}\t#{array[3].chr}\n\n\n#{string}")
    output.close
  end
  
  if string.include?"require"
    puts string
    puts "Probably ruby!"
    output = File.open("decrypted-alternate.txt","w")
    output.puts("#{array[0]}\t#{array[0].chr}\n#{array[1]}\t#{array[1].chr}\n#{array[2]}\t#{array[2].chr}\n#{array[3]}\t#{array[3].chr}\n\n\n#{string}")
    output.close
  end
  
  if string.include?"return"
    puts string
    puts "Found it, but language set is too large to determine the language"
    output = File.open("decrypted-alternate.txt","w")
    output.puts("#{array[0]}\t#{array[0].chr}\n#{array[1]}\t#{array[1].chr}\n#{array[2]}\t#{array[2].chr}\n#{array[3]}\t#{array[3].chr}\n\n\n#{string}")
    output.close
  end
end
time = Time.now
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
(0..52).each do |byte|
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
          newstring.push(((byte+array[i%4])%127).chr)
          i = (i+1)
        end
        j = j+1
        test newstring.to_s, array
      end
    end
  end
end

time = Time.now - time
puts "This run took #{time} seconds."

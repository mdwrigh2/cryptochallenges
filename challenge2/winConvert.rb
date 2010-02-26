def winner string, cipherArr
  output = File.open("win-decrypted.txt", "a")
  cipherArr.each do |cipher|
    output.puts(cipher)
    output.put(cipher.chr)
  end
  output.puts(string)
  output.close
end
def test string, cipherArr
  if string.include?"the"
    winner(string, cipherArr)
  end
  if string.include?"next"
    winner(string, cipherArr)
  end
end



input = File.read("win.txt")
array = Array.new
input.split(/\s/).each do |val|
  array.push val.hex.chr
end

keyspace = Array.new

(0..52).each do |byte|
  keyspace.push(byte)
end
total = 53*53*53*53*53
j = 0
keyspace.each do |cipher1|
  keyspace.each do |cipher2|
    keyspace.each do |cipher3|
      keyspace.each do |cipher4|
        keyspace.each do |cipher5|

          i = 0
          puts "On substitution #{j} of #{total}"
          array = [cipher1, cipher2, cipher3, cipher4, cipher5]
          newstring = Array.new
          array.to_s.each_byte do |byte|
            newstring.push(((byte+array[i%5])%127).chr)
            i = (i+1)
          end
          j=j+1
          test newstring.to_s, array
        end
      end
    end
  end
end

def winner string, cipherArr
  output = File.open("win-decrypted.txt", "a")
  cipherArr.each do |cipher|
    output.puts(cipher)
    output.puts(cipher.chr)
  end
  output.puts(string)
  output.close
end
def test string, cipherArr
  #if string.include?"the"
    #winner(string, cipherArr)
  #end
  if string.include?"next"
    if string.include?"carsonholgate"
      winner(string, cipherArr)
    end
  end
end



input = File.read("win.txt")
array = Array.new
input.split(/\s/).each do |val|
  array.push val.hex.chr
end

keyspace = Array.new
string = array.to_s
(0..127).each do |byte|
  keyspace.push(byte)
end
total = 128*128*128*128
j = 0
keyspace.each do |cipher1|
  keyspace.each do |cipher2|
    keyspace.each do |cipher3|
      keyspace.each do |cipher4|
        i = 0
        puts "On substitution #{j} of #{total}"
        array = [cipher1, cipher2, cipher3, cipher4]
        newstring = Array.new
        string.each_byte do |byte|
          newstring.push(((byte-array[i%4])%127).chr)
          i = (i+1)
        end
        j=j+1
        test newstring.to_s, array
      end
    end
  end
end

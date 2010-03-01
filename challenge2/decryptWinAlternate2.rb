input = File.read("DecryptedHardWinAscii.txt")
array = Array.new
asciiarray = Array.new
answer = File.read("actualwindecrypted.txt")
input.split(/\s/).each do |char|
  array.push(char.to_i)
end

key = Array.new


keyspace = Array.new
(0..127).each do |byte|
  keyspace.push byte
end
i = 0
puts answer[0]
while(key.length!=11)
  keyspace.each do |keyval|
    if(answer[i]==(((array[i]-keyval)%127)))
      key.push(keyval.chr)
      break
    end
  end
  i = i+1
  if key.length!=i
    puts "No match found =("
    puts "Lost at #{i}"
    exit
  end
end
puts key.to_s

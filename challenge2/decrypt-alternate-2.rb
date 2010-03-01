time = Time.now
input = File.read("EncryptedProcessHard.txt")
array = Array.new

input.split(/\s/).each do |char|
  hexchar = char.hex
  hexchar = (hexchar)
  array.push(hexchar.chr)
end
string = array.to_s

keystring = "pomegranate"

keyspace = Array.new
keystring.each_byte do |byte|
  keyspace.push byte
end

i=0
newstring = Array.new
string.each_byte do |byte|
  newstring.push(((byte-keyspace[i%keyspace.length])%127).chr)
  i = (i+1)
end

puts newstring.to_s
output = File.open("DecryptedHard.txt", "w")
output.puts(newstring.to_s)
output.close
time = Time.now - time
puts "This run took #{time} seconds."

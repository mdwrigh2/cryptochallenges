
array = Array.new
input = File.read("win.txt")
input.split(/\s/).each do |char|
  hexchar = char.hex
  array.push(hexchar.chr)
end

string = array.to_s

newstring = Array.new

string.each_byte do |byte|
  newstring.push(((14*byte+57)%127).chr)
end

output = File.open("decrypted-win.txt", "w")
output.puts(newstring.to_s)
output.close

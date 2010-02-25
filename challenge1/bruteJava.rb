input = File.read("FirstEncrypted.txt")
array = Array.new

input.split(/\s/).each do |char|
  hexchar = char.hex
  hexchar = (hexchar+41)%127
  array.push(hexchar.chr)
end

array.each do |char|
  p char
end

output = File.open("Unencrypted.java","w")
output.puts(array.to_s)
output.close

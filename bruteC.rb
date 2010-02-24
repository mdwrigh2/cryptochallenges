input = File.read("FirstEncrypted.txt")
array = Array.new

input.split(' ').each do |hexval|
  puts hexval.hex.chr
end
#puts array

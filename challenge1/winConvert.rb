input = File.read("win.txt")
array = Array.new
input.split(/\s/).each do |val|
  array.push val.hex.chr
end

puts array.to_s

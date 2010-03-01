def test string, a, b
  possiblestrings = %w{include import require return}
  possiblestrings.each do |stringval|
    if string.include? stringval
      output = File.open("decrypted.txt", "a")
      output.puts a
      output.puts b
      output.puts string
      output.close
      return 
    end
  end
end

array = Array.new

input = File.read("EncryptedProcess.txt")
input.split(/\s/).each do |char|
  hexchar = char.hex
  array.push(hexchar.chr)
end

string = array.to_s

keyspacea = Array.new

(0..127).each do |keyval|
  if keyval%127 !=0
    keyspacea.push keyval
  else
    puts "#{keyval} is not coprime with 127"
  end
end

keyspaceb = (0..127).to_a

keyspacea.each do |a|
  keyspaceb.each do |b|
    newstring = Array.new
    string.each_byte do |byte|
      newstring.push(((a*byte+b)%127).chr)
    end
    puts "a = #{a}\t b = #{b}"
    test newstring.to_s, a, b
  end
end


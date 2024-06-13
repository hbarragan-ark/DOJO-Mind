def rgbStringToIntegers(rgbString)
  rgbString.scan(/\d+/).map { |n| n.to_i }
end

def rgbToHexadecimal(*integerRGBValues)
  return unless integerRGBValues.compact.size == 3

  "##{ integerRGBValues.map { |n| n.to_s(16).rjust(2, '0') }.join.upcase }"
end

puts "Enter the RGB values"
rgbString = gets.chomp

return if rgbString.empty?

r, g, b = rgbStringToIntegers(rgbString)

puts rgbToHexadecimal(r, g, b)

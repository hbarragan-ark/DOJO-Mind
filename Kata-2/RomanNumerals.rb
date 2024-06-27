ROMAN_NUMERALS = {
  1000 => "M", 900 => "CM", 500 => "D", 400 => "CD",
  100 => "C", 90 => "XC", 50 => "L", 40 => "XL",
  10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"
}

INTEGER_NUMERALS = {
  "I" => 1, "V" => 5, "X" => 10, "L" => 50,
  "C" => 100, "D" => 500, "M" => 1000
}

def num_in_range?(num)
  num > 0 && num < 4000
end

def decimal_to_roman(num)
  roman = ""

  ROMAN_NUMERALS.each do |value, letter|
    break if num == 0

    next if num < value

    roman << letter * (num / value)
    num %= value
  end

  roman
end

def valid_roman_characters?(roman)
  roman.match?(/^[IVXLCDM]+$/)
end

def roman_to_decimal(roman)
  total = 0
  prev_value = 0

  roman.each_char do |char|
    value = INTEGER_NUMERALS[char]
    total += value
    total -= 2 * prev_value if prev_value < value
    prev_value = value
  end

  total
end

puts "Enter a number between 1 and 3999"
num = gets.chomp.to_i

puts num_in_range?(num) ? decimal_to_roman(num) : "Invalid input"

puts "Enter a roman numeral"
roman = gets.chomp

puts valid_roman_characters?(roman) ? roman_to_decimal(roman) : "Invalid input"

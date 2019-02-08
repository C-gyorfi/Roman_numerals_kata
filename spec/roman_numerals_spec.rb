def roman_numerals(n)
  return roman_numerals_less_nine(n) if n < 10
  return roman_numerals_less_hundred(n / 10) + roman_numerals_less_nine(n-10) if n <= 19
  return roman_numerals_less_hundred(n / 10) + roman_numerals_less_nine(n-20) if n <= 29
  return roman_numerals_less_hundred(n / 10) + roman_numerals_less_nine(n-30) if n <= 39
  return roman_numerals_less_hundred(n / 10) + roman_numerals_less_nine(n-40) if n <= 49
  roman_numerals_less_hundred(n / 10) + roman_numerals_less_nine(n-50) if n <= 59
end

def roman_numerals_less_nine(n)
  return "I" * n if n <= 3
  return "IV" if n == 4
  return "V" + "I" * (n-5) if n > 4 && n < 9
  "IX"
end

def roman_numerals_less_hundred(n)
  return "X" * n if n <= 3
  return "XL" if n == 4
  return "L" + "X" * (n-5) if n > 4 && n < 9
  "XC"
end

describe "roman_numerals" do
  ROMAN_NUMERALS = {
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    7 => "VII",
    8 => "VIII",
    9 => "IX",
    10 => "X",
    11 => "XI",
    12 => "XII",
    13 => "XIII",
    14 => "XIV",
    15 => "XV",
    16 => "XVI",
    17 => "XVII",
    18 => "XVIII",
    19 => "XIX",
    20 => "XX",
    21 => "XXI",
    22 => "XXII",
    23 => "XXIII",
    24 => "XXIV",
    25 => "XXV",
    26 => "XXVI",
    27 => "XXVII",
    28 => "XXVIII",
    29 => "XXIX",
    30 => "XXX",
    35 => "XXXV",
    39 => "XXXIX",
    40 => "XL",
    44 => "XLIV",
    45 => "XLV",
    50 => "L",
    55 => "LV"
  }

  ROMAN_NUMERALS.keys.each do |key|
    it "returns the roman number #{ROMAN_NUMERALS[key]} if called with: #{key}" do
       expect(roman_numerals(key)).to eq(ROMAN_NUMERALS[key])
    end
  end
end

def roman_numerals(n)
  nrOfThousands = n / 1000
  nrOfHundreds = (n - nrOfThousands*1000) / 100
  nrOfTens = (n - nrOfThousands*1000 - nrOfHundreds*100) / 10
  nrOfSingleDigits = n - nrOfThousands*1000 - nrOfHundreds*100 - nrOfTens*10

  num_of_Thousands(nrOfThousands) +
  num_of_hundreds(nrOfHundreds) +
  roman_numerals_less_hundred(nrOfTens) +
  roman_numerals_less_nine(nrOfSingleDigits)
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

def num_of_hundreds(n)
  return "C" * n if n <= 3
  return "CD" if n == 4
  return "D" + "C" * (n-5) if n > 4 && n < 9
  "CM"
end

def num_of_Thousands(n)
  "M" * n
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
    55 => "LV",
    58 => "LVIII",
    59 => "LIX",
    60 => "LX",
    61 => "LXI",
    70 => "LXX",
    80 => "LXXX",
    88 => "LXXXVIII",
    90 => "XC",
    99 => "XCIX",
    100 => "C",
    459 => "CDLIX",
    555 => "DLV",
    557 => "DLVII",
    999 => "CMXCIX",
    1459 => "MCDLIX",
    5987 => "MMMMMCMLXXXVII",
    36564 => "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMDLXIV"
  }

  ROMAN_NUMERALS.keys.each do |key|
    it "returns the roman number #{ROMAN_NUMERALS[key]} if called with: #{key}" do
       expect(roman_numerals(key)).to eq(ROMAN_NUMERALS[key])
    end
  end
end

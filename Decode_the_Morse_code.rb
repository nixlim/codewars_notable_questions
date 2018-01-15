#Decode the Morse code, advanced
# https://www.codewars.com/kata/decode-the-morse-code-advanced
# In this kata you have to write a Morse code decoder for wired electrical telegraph.

def decodeBits(bits)
  array_of_bits = bits.each_char.slice_when(&:!=).map(&:join)
  array_of_bits.shift if bits[0] == "0"
  array_of_bits.pop if bits[bits.length-1] == "0"
  rate_of_transmission = array_of_bits.min {|elem1,elem2| elem1.size <=> elem2.size}.length
  bit_to_morse_dict = {
      ".": "1"*rate_of_transmission,
      "-": "1"*3*rate_of_transmission,
      "": "0"*rate_of_transmission,
      " ": "0"*3*rate_of_transmission,
      "   ": "0"*7*rate_of_transmission
  }
  array_of_bits.map {|str| bit_to_morse_dict.key(str)}.join().to_s
end

def decodeMorse(morseCode)
  morseCode.strip.split("   ").map {|word| word.split(" ").map {|i| MORSE_CODE[i]}.join()}.join(" ")
end
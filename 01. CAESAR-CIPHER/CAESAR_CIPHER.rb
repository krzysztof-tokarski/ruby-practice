def caesar_cipher(string, shift_factor) 
  alphabet = *('a'..'z')
  alphabet_clone = alphabet.clone
  shift_factor = shift_factor.remainder(26)

  if shift_factor > 0
    removed_letters = alphabet_clone.pop(shift_factor)
    shifted_alphabet = removed_letters.concat(alphabet_clone)
  elsif shift_factor < 0
    removed_letters = alphabet_clone.slice!(0, shift_factor.abs)
    shifted_alphabet = alphabet_clone.concat(removed_letters)
  end

  down_and_upcase_alphabet = alphabet.concat(alphabet.map(&:upcase))
  down_and_upcase_shifted_alphabet = shifted_alphabet.concat(shifted_alphabet.map(&:upcase))

  string_indexified = string.split('').map do |element|
    if down_and_upcase_alphabet.include? element
      down_and_upcase_alphabet.find_index(element)
    else 
      element
    end
  end

  string_relettered = string_indexified.map do |index|
    if index.is_a? Integer
      down_and_upcase_shifted_alphabet[index]
    else 
      element
    end
  end

  p string_relettered.join('')

end
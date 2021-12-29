def get_hash_letter_index
  array_letters = ("a".."z").to_a
  counter = 1

  hash_letter_index = array_letters.reduce(Hash.new) do |hash, letter|
    hash[letter] = counter
    counter += 1
    hash
  end

  hash_letter_index
end

def save_upcase_letters(array)
  upcase_index = []
  array.each_with_index do |letter, index|
    if ("A".."Z").include?(letter)
      if letter == letter.upcase
        upcase_index.push(index)
      end
    end
  end
  upcase_index
end

def convert_letter_to_index(split_string_array)
  hash_letter_index = get_hash_letter_index

  split_string_array = split_string_array.map { |letter| letter = letter.downcase }

  split_string_array.map do |letter| 
    if ("a".."z").to_a.include?(letter)
      hash_letter_index[letter]
    else
      letter
    end
  end
end

def shift_chars(integer_array, shift)
  shifted_array = integer_array.map do |integer|
    if integer.is_a? Integer
      integer += shift
    else
      integer
    end
  end
end

def wrap_chars(shifted_array)
  wrapped_array = shifted_array.map do |integer|
    unless integer.is_a? Integer
      integer
    else
      if integer > 26
        integer = integer - 26
      elsif integer < 1
        integer = integer + 26
      else
        integer
      end
    end
  end
  wrapped_array
end

def convert_index_to_letters(index_array)
  hash_letter_index = get_hash_letter_index
  converted_index = index_array.map do |index| 
    if index.is_a? Integer
      hash_letter_index.key(index)
    else
      index
    end
  end
end

def upcase_by_index(array, index_array)
  index_array.each do |index|
    array[index] = array[index].upcase
  end
  array
end

def caesar_cipher(string, shift)
  split_array = string.split("")
  upcase_index = save_upcase_letters(split_array)
  indexed_array = convert_letter_to_index(split_array)
  shifted_array = shift_chars(indexed_array, shift)
  wrapped_array = wrap_chars(shifted_array)
  converted_array = convert_index_to_letters(wrapped_array)
  upcased_array = upcase_by_index(converted_array, upcase_index)
  upcased_array.join("")
end

puts caesar_cipher("What a string!", 5)
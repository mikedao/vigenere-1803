require 'pry'
class Vigenere
  def encode(message, phrase)
    # rotation = find the corresponding number for 
    # each character in phrase
    rotation = create_rotation(phrase)

    # find the number for each character in 
    # planintext
    message_numbers = create_rotation(message)

    # add rotation to each message number
    rotated_numbers = add_rotation_to_message(message_numbers, rotation)
    # translate sum to encoded message
    convert_to_letters(rotated_numbers)
  end

  def create_rotation(phrase)
    phrase.chars.map do |letter|
      letter.ord - 96
    end
  end

  def add_rotation_to_message(message_numbers, rotation)
    message_numbers.map do |num|
      sum = 0
      if num == (32 - 96)
        sum = 32
      else
        sum = num + rotation.first
        sum -= 26 if sum > 26
        rotation.rotate!(1)
      end
      sum
    end
  end

  def convert_to_letters(numbers)
    numbers.map do |num|
      if num == 32
        " "
      else
        (num + 96).chr
      end
    end.join
  end
end
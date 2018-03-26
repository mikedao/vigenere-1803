require 'minitest/autorun'
require 'minitest/pride'
require './lib/vigenere'

class VigenereTest < Minitest::Test
  def test_it_can_translate_a_word
    v = Vigenere.new    

    actual = v.encode("pizza", "abc")
    expected = "qkcac"

    assert_equal expected, actual
  end

  def test_it_can_create_rotation
    v = Vigenere.new

    actual = v.create_rotation("abc")
    expected = [1,2,3]

    assert_equal expected, actual
  end

  def test_it_can_create_different_rotation
    v = Vigenere.new

    actual = v.create_rotation("pizza")
    expected = [16,9,26,26,1]

    assert_equal expected, actual
  end

  def test_it_can_add_rotation
    v = Vigenere.new

    actual = v.add_rotation_to_message([16,9,26,26,1], [1,2,3])
    expected = [17,11,3,1,3]

    assert_equal expected, actual
  end

  def test_it_can_conver_to_letters
    v = Vigenere.new
    actual = v.convert_to_letters([17,11,3,1,3])
    expected = "qkcac" 

    assert_equal expected, actual
  end

  def test_it_can_encode_a_phrase
    v = Vigenere.new

    actual = v.encode("pizza pie", "abc")
    expected = "qkcac sjg"

    assert_equal expected, actual
  end

end
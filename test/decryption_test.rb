require "minitest/autorun"
require "minitest/pride"
require "./lib/decryption"
require "pry"

class DecryptionTest < Minitest::Test

  def test_if_decryption_class_is_created
    dec = Enigma.new

    assert_equal Decryption, dec.class
  end

  def test_if_encryption_class_is_created
    enc = Enigma.new

    assert_equal Encryption, enc.class
  end

  # def test_crack
  #   crack = Enigma.new
  #
  #
  # end

end

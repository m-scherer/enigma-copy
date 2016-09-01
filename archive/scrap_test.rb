require "minitest/autorun"
require "minitest/pride"
require "./lib/keygen"
require "pry"

class KeyGenTest < Minitest::Test

  def test_if_key_is_split
    keygen = KeyGen.new(41521)

    assert_equal [4,1,5,2,1], keygen.key_rotation
  end

  def test_if_a_rotation_is_correct
    keygen = KeyGen.new(41521)

    assert_equal 41, keygen.a_rotation
  end

end

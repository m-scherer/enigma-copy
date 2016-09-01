require "minitest/autorun"
require "minitest/pride"
require "./lib/key"
require "pry"

class KeyTest < Minitest::Test

  def test_key_array_created
    key = Key.new

    assert key.key > 9999
    assert key.key < 100000
  end

  def test_rotation_a_creation
    key = Key.new
    key.split_key

    assert_equal 2, key.rotation_a.to_s.length
  end

end

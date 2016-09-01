require "minitest/autorun"
require "minitest/pride"
require "./lib/decryption_rotation"
require "pry"


class DecryptionRotationTest < Minitest::Test

  def test_encryption_rotation_class_is_correct
    decr = DecryptionRotation.new(41521, 300816)

    assert_equal DecryptionRotation, decr.class
  end

  def test_split_key_has_key
    decr = DecryptionRotation.new(41521, 300816)

    assert_equal Fixnum, decr.key.class
  end

  def test_key_split_to_rotations
    decr = DecryptionRotation.new(41521, 300816)

    assert_equal 41, decr.rotation_a
  end

  def test_offset_rotation_is_splitting_correctly
    decr = DecryptionRotation.new(41521, 300816)

    assert_equal 5, decr.offset_a
  end

  def test_the_keys_and_offset_are_combining
    decr = DecryptionRotation.new(41521, 300816)

    assert_equal 46, decr.combine_a
  end
  #
  # def test_encryption_rotation_has_combine_a
  #   decr = DecryptionRotation.new
  #
  #   assert_equal Fixnum, decr.combine_a.class
  #
  # end
  #
  # def test_encryption_rotation_has_key
  #   decr = DecryptionRotation.new
  #
  #   assert_equal Fixnum, decr.key.class
  # end
  #
  # def test_encryption_roation_has_date
  #   decr = DecryptionRotation.new
  #
  #   assert_equal String, decr.date.class
  # end
  #
end

require "minitest/autorun"
require "minitest/pride"
require "./lib/encryption_rotation"
require "pry"


class EncryptionRotationTest < Minitest::Test

  def test_encryption_rotation_class_is_correct
    ert = EncryptionRotation.new

    assert_equal EncryptionRotation, ert.class
  end

  def test_encryption_rotation_has_combine_a
    ert = EncryptionRotation.new

    assert_equal Fixnum, ert.combine_a.class

  end

  def test_encryption_rotation_has_key
    ert = EncryptionRotation.new

    assert_equal Fixnum, ert.key.class
  end

  def test_encryption_roation_has_date
    ert = EncryptionRotation.new

    assert_equal String, ert.date.class
  end

end

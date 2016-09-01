require "minitest/autorun"
require "minitest/pride"
require "./lib/encryption"
require "pry"

class EncryptionTest < Minitest::Test

  def test_has_Encryption_class_been_created
    enc = Encryption.new

    assert_equal Encryption, enc.class
  end

  def test_simple_rotation_creation
    enc = Encryption.new

    assert_equal 4, enc.simple_rotations.length
  end

  def test_message_is_being_split
    enc = Encryption.new

    assert_equal String, enc.message.class
  end

  def test_if_load_file_has_filename
    enc = Encryption.new

    assert_equal "message.txt", enc.message_file[0]
  end

  def test_if_write_file_has_name
    enc = Encryption.new#("message.txt", "encryption.txt")

    assert_equal "encrypted.txt", enc.message_file[1]
  end

end

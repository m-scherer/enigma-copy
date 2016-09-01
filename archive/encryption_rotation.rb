require "date"
require "pry"
require "./lib/encryption_key"
require "./lib/encryption_offset"


class EncryptionRotation
  attr_reader :combine_a, :combine_b, :combine_c, :combine_d, :key, :date
  def initialize
    @combine_a = combine_a
    @combine_b = combine_b
    @combine_c = combine_c
    @combine_d = combine_d
    @key = key
    @date = date
    create_objects
  end

  def create_objects
    offset = Offset.new
    key = Key.new
    combined_rotation(key, offset)
    key_and_date(key, offset)
  end
  #key.key_rotations()
  #offset.last_four_digits
  def combined_rotation(key, offset)
    @combine_a = key.rotation_a + offset.offset_a
    @combine_b = key.rotation_b + offset.offset_b
    @combine_c = key.rotation_c + offset.offset_c
    @combine_d = key.rotation_d + offset.offset_d
  end

  def key_and_date(key, offset)
    @key = key.key
    @date = offset.today
  end

end

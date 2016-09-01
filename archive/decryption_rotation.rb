require "pry"


class DecryptionRotation
  attr_reader :combine_a, :combine_b, :combine_c, :combine_d, :key, :date, :rotation_a, :offset_a
  def initialize(key, date)
    @combine_a = combine_a
    @combine_b = combine_b
    @combine_c = combine_c
    @combine_d = combine_d
    @key = key
    @date = date
    split_key(@key)
    last_four_digits(@date)
  end

  def split_key(key)
    key_split_s = key.to_s.split(//)
    key_split_i = key_split_s.map do |num|
      num.to_i
    end
    key_rotations(key_split_i)
  end

  def key_rotations(rotate_key)
    rotation_num = rotate_key.length
    rotation_split = rotation_num / 2
    @rotation_a = rotate_key[0..1].join.to_i
    @rotation_b = rotate_key[1..2].join.to_i
    @rotation_c = rotate_key[2..3].join.to_i
    @rotation_d = rotate_key[3..4].join.to_i
  end

  def last_four_digits(date)
    date_squared = date.to_i ** 2
    date_split_s = date_squared.to_s.split(//)
    last_four = date_split_s[-4..-1].map do |num|
      num.to_i
    end
    offset_rotation(last_four)
  end

  def offset_rotation(last_four)
    rotation_num = last_four.length
    rotation_split = rotation_num / 2
    @offset_a = last_four[0]
    @offset_b = last_four[1]
    @offset_c = last_four[2]
    @offset_d = last_four[3]

    combined_rotation
  end

  def combined_rotation
    @combine_a = @rotation_a + @offset_a
    @combine_b = @rotation_b + @offset_b
    @combine_c = @rotation_c + @offset_c
    @combine_d = @rotation_d + @offset_d
  end

end

require "pry"
class Key
  attr_reader :key, :rotation_a, :rotation_b, :rotation_c, :rotation_d

  def initialize(key)
    @key = key
    @rotation_a = rotation_a
    @rotation_b = rotation_b
    @rotation_c = rotation_c
    @rotation_d = rotation_d
    split_key
  end

  def split_key
    key_split_s = @key.to_s.split(//)
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

end

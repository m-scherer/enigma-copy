## key generator
require "./test/keygen_test"
require "pry"

class KeyGen
attr_reader :key_split_to_i

  def initialize(key)
    @key_split_to_i = nil
    @key = key
  end

  def key_rotation()
    #key = 41521
    #A rotation = 41
    #B rotation = 15
    #C rotation = 52
    #D rotation = 21

    key_split = @key.to_s.split(//)
    @key_split_to_i = key_split.map do |num|
      num.to_i
    end

    @key_split_to_i
  end

  def a_rotation()
    a_rot = @key.to_s.split(//)
    a_rot = a_rot[0] + a_rot[1]
    a_rot.to_i
  end

end

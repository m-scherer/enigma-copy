require "date"
require "pry"
require_relative "encryption_key"

class Offset
attr_reader :today, :offset_a, :offset_b, :offset_c, :offset_d, :last_four

  def initialize(date = DateTime.now.strftime("%d%m%y"))
    @today = date
    @offset_a = nil
    @offset_b = nil
    @offset_c = nil
    @offset_d = nil
    last_four_digits
  end

  def last_four_digits
    today_squared = @today.to_i ** 2
    today_split_s = today_squared.to_s.split(//)
    last_four = today_split_s[-4..-1].map do |num|
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
  end

end

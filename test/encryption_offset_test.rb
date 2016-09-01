require "minitest/autorun"
require "minitest/pride"
require "./lib/offset"
require "./lib/key"
require 'date'
require "pry"

class OffsetTest < Minitest::Test

  def test_has_an_offset
    offset = Offset.new

    assert_equal DateTime.now.strftime("%d%m%y"), offset.today
  end

  def test_last_four_digits
    offset = Offset.new
    offset.last_four_digits
    date_today = DateTime.now.strftime("%d%m%y")


    assert_equal date_today, Math.sqrt(offset.today_squared).to_i.to_s

  end

  def test_key_passes_to_offset
    new_key = Key.new
    offset = Offset.new

    assert_equal Fixnum, new_key.rotation_a.class
  end
end

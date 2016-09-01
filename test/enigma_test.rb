require "minitest/autorun"
require "minitest/pride"
require "./lib/enigma"
require "pry"

class EnigmaTest < Minitest::Test

  def test_case_name
    engima = Enigma.new

    assert_equal Enigma, engima.class
  end

  def test_case_name

  end

end

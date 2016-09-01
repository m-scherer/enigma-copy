require 'pry'

class Crack
  attr_reader :file_inputs, :message

  def initialize(file_inputs = ARGV)
    @file_inputs = file_inputs
    @message = load_file
    @all_key_rotations = []
    @all_simple_rotations = []
  end

  def load_file
    f = File.open(@file_inputs[0])
    @f_lines = f.read.split("\n").join
    return @f_lines
  end

  def generate_key_rotations
    all_five_digit_nums = (10000.to_s..99999.to_s).to_a

    temp_arr = []
    all_key_rotations = []
    one_num = ""

    while all_five_digit_nums.length > 0
      one_num = all_five_digit_nums.shift
      temp_arr << (one_num[0] + one_num[1])
      temp_arr << (one_num[1] + one_num[2])
      temp_arr << (one_num[2] + one_num[3])
      temp_arr << (one_num[3] + one_num[4])
      @all_key_rotations << temp_arr
      temp_arr = []
    end
    generate_date_rotations
  end

  def generate_date_rotations
    date = @file_inputs[2]
    today_squared = date.to_i ** 2
    today_split_s = today_squared.to_s.split(//)
    last_four = today_split_s[-4..-1].map do |num|
      num.to_i
    end
    generate_all_rotations(last_four)
  end

  def generate_all_rotations(date_rotations)
    temp_key_rotations = @all_key_rotations
    temp_all_rotations = []
    one_key_rotation = ""
    while temp_key_rotations.length > 0
      one_key_rotation = temp_key_rotations.shift
      temp_all_rotations << ((one_key_rotation[0].to_i + date_rotations[0])%26)
      temp_all_rotations << ((one_key_rotation[1].to_i + date_rotations[1])%26)
      temp_all_rotations << ((one_key_rotation[2].to_i + date_rotations[2])%26)
      temp_all_rotations << ((one_key_rotation[3].to_i + date_rotations[3])%26)
      @all_simple_rotations << temp_all_rotations
      temp_all_rotations = []
    end
    recursive_call
  end


  def recursive_call
    @encrypted_perm = @f_lines.split(//)
    encrpyted_temp = @encrypted_perm
    split_encrypted_recurse(encrypted_temp)
  end

  def split_encrypted_recurse(encrypted)

        if encrypted.length == 0
          encrypted = @encrypted_perm
        else
          four_char = encrypted.shift(4)
          rotate(four_char, @all_simple_rotations)
          split_encrypted_recurse(encrypted)
        end
  end

  def rotate(four_char, simple_rotations, count=0)
    new_simple_rotations = @all_simple_rotations
    one_rotation = ""
    @decrypted_message = []
    #while new_simple_rotations.length > 0
    #change to "..end.."
    until @decrypted_message[-7..-1] == ["u","r","r","i","t","o","s"]
      one_rotation = new_simple_rotations.shift
    #binding.pry
    #@decrypted_message = []
      four_char.each_with_index do |char, index|
        #cbinding.pry
          ascii_shift = char.ord - one_rotation[index]
          if ascii_shift < 32
            #binding.pry
            less_than_shift = 32 - ascii_shift
            less_than_shift = 127 - less_than_shift
            @decrypted_message << (less_than_shift).chr
          #  binding.pry
          else
              @decrypted_message << (ascii_shift).chr
            end
      end
    end
    binding.pry
  end
  #take in encrpyted file
  #split encrpyted file into an array of strings (.split(//))
  #until encrpyted array length = 0, shift off four characters at a time
  #
  #
end

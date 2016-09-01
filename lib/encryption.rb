require "./lib/encryption_rotation"
require "./lib/key"
require "pry"



class Encryption
  attr_reader :message, :four_char, :encrypted, :simple_rotations, :encrypted_message, :message_file, :key, :date

  def initialize(message, key, offset)
    @temp_key = Key.new(key)
    @temp_offset = Offset.new(offset)
    e = EncryptionRotation.new(@temp_key, @temp_offset)
    # @message_file = message_file
    @simple_rotations = [e.combine_a%95, e.combine_b%95, e.combine_c%95, e.combine_d%95]
    @message = message
    @encrypted_message = []
    @key = e.key
    @date = e.date
    call_methods
    @encrypted_message.join
  end

  def call_methods
    split_message
    # write_file

  end

  def split_message
    split = @message.split(//)
    split_message_recurse(split)
  end

  def split_message_recurse(split)
    unless split.length == 0
        four_char = split.shift(4)
      rotate(four_char, @simple_rotations)
      split_message_recurse(split)
    end


  end

  def rotate(four_char, simple_rotations)
    four_char.each_with_index do |char, index|
        ascii_shift = char.ord + simple_rotations[index]
        if ascii_shift > 127
          less_than_shift = ascii_shift - 127
          less_than_shift = less_than_shift + 32
          @encrypted_message << (less_than_shift).chr
        else
            @encrypted_message << (ascii_shift).chr
        end
    end

  end

  # def load_file(message_file)
  #   f = File.open(message_file[0])
  #   f_lines = f.read.split("\n").join
  #   return f_lines
  # end

  # def write_file
  #   message_string = @encrypted_message.join
  #   f = File.write(@message_file[1], message_string)
  #   # puts "Created '#{@message_file[1]}' with the key #{@key} and date #{@date}"
  # end

end
#
# Encryption.new(message, key, date)

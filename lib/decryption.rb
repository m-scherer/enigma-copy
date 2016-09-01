require "./lib/decryption_rotation"
require "pry"

class Decryption
  attr_reader :four_char, :encrypted, :decrypted_message, :date, :key

  def initialize(message, key, date)
    @key = key
    @date = date
    d = DecryptionRotation.new(@key, @date)
    @encrypted = message
    @simple_rotations = [d.combine_a%95, d.combine_b%95, d.combine_c%95, d.combine_d%95]
    @decrypted_message = []
    call_methods
  end

  def call_methods
    recursive_call
  end

  def recursive_call
    encrypted = @encrypted.split(//)
    split_encrypted_recurse(encrypted)
  end

  def split_encrypted_recurse(encrypted)
      unless encrypted.length == 0
          four_char = encrypted.shift(4)

      rotate(four_char, @simple_rotations)
      split_encrypted_recurse(encrypted)

    end
  end

  def rotate(four_char, simple_rotations, count=0)
    four_char.each_with_index do |char, index|
        ascii_shift = char.ord - simple_rotations[index]
        if ascii_shift < 32
          less_than_shift = 32 - ascii_shift
          less_than_shift = 127 - less_than_shift
          @decrypted_message << (less_than_shift).chr
        else
            @decrypted_message << (ascii_shift).chr
        end
    end
  end

  # def write_file
  #   decrypted_message_joined = @decrypted_message.join
  #   f = File.write(@encrypted_file[1], decrypted_message_joined)
  #   puts "Created '#{@encrypted_file[1]}' with the key #{@key} and date #{@date}"
  # end
  #
  # def load_file(message_file)
  #   f = File.open(@encrypted_file[0])#("message.txt")
  #   f_lines = f.read.split("\n").join
  #   return f_lines
  # end

end

require "./lib/encryption"
require "./lib/decryption"
require "date"
require "pry"

class Enigma
attr_reader :key_encrypt, :date_encrypt, :key_decrypt, :date_decrypt, :key_crack, :date_crack

  def initialize
    @key_encrypt
    @date_encrypt
    @key_decrypt
    @date_decrypt
    @key_crack
    @date_crack
  end

  def encrypt(message, key=rand(10000..99999), date=DateTime.now)
    e = Encryption.new(message, key, date.strftime("%d%m%y"))
    @key_encrypt = e.key
    @date_encrypt = e.date
    e.encrypted_message.join
  end

  def decrypt(message, key=nil, date=DateTime.now)
    d = Decryption.new(message, key, date.strftime("%d%m%y"))
    @key_decrypt = d.date
    @date_decrypt = d.key
    d.decrypted_message.join
  end

end

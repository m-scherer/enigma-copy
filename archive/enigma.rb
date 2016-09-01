require "./lib/encryption"
require "./lib/decryption"
require "pry"

class Enigma

  def call_encryption()
    Encryption.new
  end

  def call_decryption
    Decryption.new
  end

end

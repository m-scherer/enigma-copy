require_relative 'enigma'

incoming = File.read(ARGV[0]).chomp
e = Enigma.new
output = e.encrypt(incoming)
outgoing = File.write(ARGV[1], output)

puts "Created '#{ARGV[1]}' with the key #{e.key_encrypt} and date #{e.date_encrypt}"

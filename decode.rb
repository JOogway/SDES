class Decode
  require_relative 'sbox.rb'
  require_relative 'perms.rb'
  require_relative 'sdes.rb'
  p = Perms.new
  s = SDES.new
  pw =[]
  def decode final
    p.pw final,pw
  end
end
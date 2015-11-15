class Sbox
  def sbox1 tab , s0
    puts case tab
           when '[0, 0, 0, 0]','[0, 1, 0, 1]','[1, 0, 1, 0]','[1, 1, 0, 0]','[1, 0, 1, 1]'
             s0.push(0)
             s0.push(1)
           when '[0, 0, 1, 0]','[0, 1, 1, 1]','[1, 0, 0, 0]'
             s0.push(0)
             s0.push(0)
           when '[0, 1, 0, 0]','[0, 0, 0, 1]','[1, 1, 1, 0]','[1, 0, 0, 1]','[1, 1, 0, 1]'
             s0.push(1)
             s0.push(1)
           when '[0, 1, 1, 0]','[0, 0, 1, 1]','[1, 1, 1, 1]'
             s0.push(1)
             s0.push(0)
           else
             puts "ni ma"
         end
  end
  def sbox2 tab , s0
    puts case tab
           when '[0, 0, 0, 0]','[0, 0, 1, 1]','[1, 0, 1, 0]','[1, 1, 0, 1]','[1, 1, 1, 0]'
             s0.push(0)
             s0.push(0)
           when '[0, 0, 0, 1]','[0, 1, 0, 0]','[1, 0, 0, 1]'
             s0.push(1)
             s0.push(0)
           when '[0, 0, 1, 0]','[0, 1, 0, 1]','[1, 0, 1, 1]','[1, 1, 0, 0]'
             s0.push(0)
             s0.push(1)
           when '[0, 1, 1, 0]','[0, 1, 1, 1]','[1, 0, 0, 0]','[1, 1, 1, 1]'
             s0.push(1)
             s0.push(1)
           else
             puts 'ni ma'
         end
  end
end
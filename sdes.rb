class SDES
  s0 = []
  s1 = []
  pw = []
  p4 = []
  w = [1,1,1,1,0,0,0]
  p10 = []
  xor3 = []
  if w.length < 8
    w.push(0)
  end
  def p10w8 tab1, tab2
    tab1.push(tab2[5])
    tab1.push(tab2[2])
    tab1.push(tab2[6])
    tab1.push(tab2[3])
    tab1.push(tab2[7])
    tab1.push(tab2[4])
    tab1.push(tab2[9])
    tab1.push(tab2[8])
  end
  def perm tab1, tab2
    tab2.push(tab1[2])
    tab2.push(tab1[4])
    tab2.push(tab1[1])
    tab2.push(tab1[6])
    tab2.push(tab1[3])
    tab2.push(tab1[9])
    tab2.push(tab1[0])
    tab2.push(tab1[8])
    tab2.push(tab1[7])
    tab2.push(tab1[5])
  end

  def p4 tab1,tab2, p4
    p4.push(tab1[1])
    p4.push(tab2[1])
    p4.push(tab2[0])
    p4.push(tab1[0])
  end
  def pw w, pw
  pw.push(w[1])
  pw.push(w[5])
  pw.push(w[2])
  pw.push(w[0])
  pw.push(w[3])
  pw.push(w[7])
  pw.push(w[4])
  pw.push(w[6])
  end
  def sbox1 tab , s0
    puts case tab
           when "[0, 0, 0, 0]"
             s0.push(0)
             s0.push(1)
           when "[0, 0, 1, 0]"
             s0.push(0)
             s0.push(0)
           when "[0, 1, 0, 0]"
             s0.push(1)
             s0.push(1)
           when "[0, 1, 1, 0]"
             s0.push(1)
             s0.push(0)
           when "[0, 0, 0, 1]"
             s0.push(1)
             s0.push(1)
           when "[0, 0, 1, 1]"
             s0.push(1)
             s0.push(0)
           when "[0, 1, 0, 1]"
             s0.push(0)
             s0.push(1)
           when "[0, 1, 1, 1]"
             s0.push(0)
             s0.push(0)
           when "[1, 0, 0, 0]"
             s0.push(0)
             s0.push(0)
           when "[1, 0, 1, 0]"
             s0.push(0)
             s0.push(1)
           when "[1, 1, 0, 0]"
             s0.push(0)
             s0.push(1)
           when "[1, 1, 1, 0]"
             s0.push(1)
             s0.push(1)
           when "[1, 0, 0, 1]"
             s0.push(1)
             s0.push(1)
           when "[1, 0, 1, 1]"
             s0.push(0)
             s0.push(1)
           when "[1, 1, 0, 1]"
             s0.push(1)
             s0.push(1)
           when "[1, 1, 1, 1]"
             s0.push(1)
             s0.push(0)
           else
             puts "ni ma"
         end
  end
  def sbox2 tab , s0
    puts case tab
           when "[0, 0, 0, 0]"
             s0.push(0)
             s0.push(0)
           when "[0, 0, 0, 1]"
             s0.push(1)
             s0.push(0)
           when "[0, 0, 1, 0]"
             s0.push(0)
             s0.push(1)
           when "[0, 0, 1, 1]"
             s0.push(0)
             s0.push(0)
           when "[0, 1, 0, 0]"
             s0.push(1)
             s0.push(0)
           when "[0, 1, 0, 1]"
             s0.push(0)
             s0.push(1)
           when "[0, 1, 1, 0]"
             s0.push(1)
             s0.push(1)
           when "[0, 1, 1, 1]"
             s0.push(1)
             s0.push(1)
           when "[1, 0, 0, 0]"
             s0.push(1)
             s0.push(1)
           when "[1, 0, 0, 1]"
             s0.push(1)
             s0.push(0)
           when "[1, 0, 1, 0]"
             s0.push(0)
             s0.push(0)
           when "[1, 0, 1, 1]"
             s0.push(0)
             s0.push(1)
           when "[1, 1, 0, 0]"
             s0.push(0)
             s0.push(1)
           when "[1, 1, 0, 1]"
             s0.push(0)
             s0.push(0)
           when "[1, 1, 1, 0]"
             s0.push(0)
             s0.push(0)
           when "[1, 1, 1, 1]"
             s0.push(1)
             s0.push(1)
           else
             puts "ni ma"
         end
  end
  f = SDES.new
  #puts w.inspect
  kp= [1,1,0,0,0,0,0,0,1,1]

  f.perm kp, p10
  puts "Permutacja p10: #{p10.inspect}"
  p11 = p10[0..4]
  p12 = p10[5..10]

  p11.push(p11[0])
  p11 = p11[1..5]

  p12.push(p12[0])
  p12 = p12[1..5]

  sl1= p11+p12

  #puts p11.inspect
  #puts p12.inspect
  puts "SL1 : #{sl1.inspect}"

  p10w8 = []
  f.p10w8 p10w8, sl1

  k1 = p10w8
  puts "Klucz pierwszej rundy #{k1.inspect}"
  #puts p11.inspect
  p11.push(p11[0])
  p11.push(p11[1])
  p11 = p11[2..6]

  #puts p11.inspect
  p12.push(p12[0])
  p12.push(p12[1])
  p12 = p12[2..6]
  sl2 = p11 + p12
  #puts p12.inspect
  puts "SL2: #{sl2.inspect}"

  p10w8i = []
  f.p10w8 p10w8i,sl2

  k2 = p10w8i
  puts "Klucz drugiej rundy #{k2.inspect}"

  t = [1,0,1,1,1,0,0,0]
  puts "Tekst do zaszyfrowania: #{t.inspect}"
  t1 = t[0..3]
  t2 = t[4..8]
  puts "Pierwsza polowa tekstu #{t1.inspect}"
  puts "Druga polowa tekstu #{t2.inspect}"

  t21 = []
  t22 = []

  t22.push(t2[3])
  t22.push(t2[0])
  t22.push(t2[1])
  t22.push(t2[2])
  t22.push(t2[1])
  t22.push(t2[2])
  t22.push(t2[3])
  t22.push(t2[0])

  puts "Pierwsza permutacja P4W10 na t : #{t22.inspect}"
  xor = [0..7]
  puts t22.inspect
  puts k1.inspect
  for i in 0..7

    xor[i] = (t22[i].to_i+k1[i].to_i)

  end

  puts "Xor1 : #{xor.inspect}"
  xor1 = xor[0..3]
  xor2 = xor[4..7]
  puts "Pierwsza polowa xor #{xor1.inspect}"
  puts "Druga polowa xor #{xor2.inspect}"

  f.sbox1 xor1.to_s, s0
  f.sbox2 xor2.to_s, s1

  puts s0.inspect
  f.p4 s0,s1,p4
  puts p4.inspect
  for i in 0..3
    xor3[i]=(t[i].to_i+p4[i].to_i)%2
  end
  xortp4= xor3[0..3]+w[3..6]
  puts xortp4.inspect
  f.pw w, pw
  puts "PW: #{pw.inspect}"
end

class SDES
  w = [1,1,1,1,0,0,0]
  p10 = []
  if w.length < 8
    w.push(0)
  end
  def P10w8 tab1, tab2
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
  def p4
    
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
  f.P10w8 p10w8, sl1

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
  f.P10w8 p10w8i,sl2

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




end

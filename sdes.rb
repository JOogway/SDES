class SDES
  require_relative 'sbox.rb'
  require_relative 'perms.rb'

  s01 = []
  s11 = []
  s02 = []
  s12 = []
  pw = []
  p4 = []
  p42 = []
  p10 = []
  xor3 = []
  xor32=[]
  xor4 = []
  p10w8 = []
  final = []

  w = [1,0,0,0,0,1,1,1]

  if w.length < 8
    w.push(0)
  end

  s = Sbox.new
  p = Perms.new
  puts "W: #{w.inspect}"
  kp= [1,0,0,0,0,1,1,1,1,1]

  p.perm kp, p10
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

  p.p10w8 p10w8, sl1

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
  p.p10w8 p10w8i,sl2

  k2 = p10w8i
  puts "Klucz drugiej rundy #{k2.inspect}"

  puts "Tekswdo zaszyfrowania: #{w.inspect}"
  p.pw w, pw
  tp1 = pw[0..3]
  tp2 = pw[4..8]
  puts "Pierwsza polowa tekstu #{tp1.inspect}"
  puts "Druga polowa tekstu #{tp2.inspect}"

  t21 = []
  t22 = []
  p.p4w8 t22, tp2

  puts "Pierwsza permutacja P4W8 na w: #{t22.inspect}"
  xor = [0..7]
  puts "Po operacji P4W8: #{k1.inspect}"

  for i in 0..7
    xor[i] = (t22[i].to_i+k1[i].to_i)%2
  end

  puts "Xor1 : #{xor.inspect}"
  xor1 = xor[0..3]
  xor2 = xor[4..7]
  puts "Pierwsza polowa xor #{xor1.inspect}"
  puts "Druga polowa xor #{xor2.inspect}"

  s.sbox1 xor1.to_s, s01
  s.sbox2 xor2.to_s, s11

  s00 = s01 + s11
  puts "cos #{s00}"
  p.p4 s01,s11,p4
  puts p4.inspect
  for i in 0..3
    xor3[i]=(pw[i].to_i+p4[i].to_i)%2
  end
  xortp4= xor3[0..3]+pw[4..7]
  puts "po polaczeniu, wynik zasadniczej procedury szyfrujacej #{xortp4.inspect}"
  #p.pw w, pw
  puts "PW: #{pw.inspect}"
  p1 = k1[4..7]+pw[4..7]
  puts p1.inspect
  p2 = p1[4..7]+p1[0..3]
  puts p2.inspect
  p3 = k2[4..7]+p2[4..7]
  puts p3.inspect

  t2= xortp4[4..7]+xortp4[0..3]
  puts "Po zaszyfrowaniu kluczem pierwszej rundy #{t2.inspect}"
  t2p2 = t2[4..7]

  p.p4w8 t21, t2p2
  puts t21.inspect
  for i in 0..7
    xor4[i] = (t21[i].to_i+k2[i].to_i)%2
  end

  puts "Xor2 : #{xor4.inspect}"
  xor12 = xor4[0..3]
  xor22 = xor4[4..7]
  puts "Pierwsza polowa Xor2 #{xor12.inspect}"
  puts "Druga polowa Xor2 #{xor22.inspect}"

  s.sbox1 xor12.to_s, s02
  s.sbox2 xor22.to_s, s12

  p.p4 s02,s12,p42
  puts p42.inspect

  for i in 0..3
    xor32[i]=(t2[i].to_i+p42[i].to_i)%2
  end

  xortp42= xor32[0..3]+t2[4..7]
  puts "Tekst po zaszyfrowaniu kluczem drugiej rundy: #{xortp42.inspect}"
  p.po final, xortp42
  puts "Zaszyfrowany tekst: #{final.inspect}"

  puts"\n\n\n\n\n"

  puts "Pora na odszyfrowanie"
  pw = []
  tab = []
  tab1 = []
  sumka1 = []
  sumka2 = []
  eska1 = []
  eska2 = []
  p4 = []
  xorx = []
  xorx2 = []
  cos1=[]
  p.pw final, pw
  puts pw.inspect
  half1 = pw[0..3]
  half2 = pw[4..7]
  p.p4w8 tab,half2
  puts tab.inspect
  for i in 0..7
    sumka1[i] = (tab[i].to_i+k2[i].to_i)%2
  end
  puts "Po dodaniu z kluczem drugiej rundy#{sumka1}"
  puts polowasumki1=sumka1[0..3].inspect
  puts polowasumki2=sumka1[4..7].inspect
  s.sbox1 polowasumki1,eska1
  s.sbox2 polowasumki2,eska2
  eska = eska1+eska2
  puts eska.inspect
  p.p4 eska1,eska2,p4
  puts p4.inspect
  for i in 0..3
    xorx[i] = (half1[i]+p4[i])%2
  end
  puts xorx.inspect
  cos1=xorx[0..3] + final[4..7]
  puts"Po uzyciu klucza 2 rundy: #{cos1}"
  cos12 = cos1[4..7]+cos1[0..3]
  puts cos12.inspect
  half3 = cos12[4..7]
  p.p4w8 tab1,half3
  for i in 0..7
    sumka2[i] = (tab1[i].to_i+k1[i].to_i)%2
  end
  eska1=[]
  eska2=[]
  polowasumkidrugiej1=sumka2[0..3].inspect
  polowasumkidrugiej2=sumka2[4..7].inspect
  s.sbox1 polowasumkidrugiej1,eska1
  s.sbox2 polowasumkidrugiej2,eska2
  p4 = []
  eska = eska1+eska2
  puts eska.inspect
  p.p4 eska1,eska2,p4
  half4 = cos1[4..7]
  for i in 0..3
    xorx2[i] = (half4[i]+p4[i])%2
  end
  cos2=xorx2[0..3] + cos1[4..7]
  puts cos2.inspect

end
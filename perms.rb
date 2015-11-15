class Perms

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
  def p4w8 t22, t2
    t22.push(t2[3])
    t22.push(t2[0])
    t22.push(t2[1])
    t22.push(t2[2])
    t22.push(t2[1])
    t22.push(t2[2])
    t22.push(t2[3])
    t22.push(t2[0])
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

  def po last, xortpl42
    last.push(xortpl42[3])
    last.push(xortpl42[0])
    last.push(xortpl42[2])
    last.push(xortpl42[4])
    last.push(xortpl42[6])
    last.push(xortpl42[1])
    last.push(xortpl42[7])
    last.push(xortpl42[5])
  end
  def decode final
    pw final,pw
  end
end
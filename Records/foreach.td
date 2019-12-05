class Reg<bits<4> v, string n> {
  bits<4> Enc = v;
  let NAME = n;
}

foreach i = [0, 1, 2, 3] in {
  def R#i : Reg<i, "r"#i>;
}


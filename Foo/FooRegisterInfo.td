class FooReg<bits<5> Enc, string n> : Register<n> {
  let HWEncoding{4-0} = Enc;
}

foreach i = 0-31 in
  def R#i  : FooReg<i, "r"#i>;

def GPR : RegisterClass<"Foo", [i32], 32, (sequence "R%u", 0, 31)>;


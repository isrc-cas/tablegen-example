class FPFormat<bits<2> val> {
  bits<2> Value = val;
}

def NotFP      : FPFormat<0>;
def ZeroArgFP  : FPFormat<1>;
def OneArgFP   : FPFormat<2>;
def TwoArgFP   : FPFormat<3>;


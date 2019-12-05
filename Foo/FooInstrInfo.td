class FooInst<dag outs, dag ins, bits<7> opc, string opstr,
              string argstr, list<dag> pattern> : Instruction {
  bits<32> Inst;

  let Namespace = "Foo";
  let Inst{6-0} = opc;
  let OutOperandList = outs;
  let InOperandList = ins;
  let AsmString = opstr # "\t" # argstr;
  let Pattern = pattern;
}

class FooInst_RR<dag outs, dag ins, bits<7> opc, string opstr,
                 string argstr, list<dag> pattern>
    : FooInst<outs, ins, opc, opstr, argstr, pattern> {
  bits<5> rd;
  bits<5> rs1;
  bits<5> rs2;

  let Inst{21-17} = rd;
  let Inst{16-12} = rs1;
  let Inst{11-7} = rs2;
}

def ADD : FooInst_RR<(outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                     0b1000000, "add", "$rd, $rs1, $rs2",
                     [(set i32:$rd, (add i32:$rs1, i32:$rs2))]>;

def SUB : FooInst_RR<(outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                     0b1000001, "sub", "$rd, $rs1, $rs2",
                     [(set i32:$rd, (sub i32:$rs1, i32:$rs2))]>;


def FU0 : FuncUnit;
def FU1 : FuncUnit;

def Itin0 : InstrItinClass;
def Itin1 : InstrItinClass;

def FooItineraries : ProcessorItineraries<
  [FU0, FU1], [],
  [
    InstrItinData<Itin0, [InstrStage<1, [FU0]>], [2,1,1]>,
    InstrItinData<Itin1, [InstrStage<1, [FU0, FU1]>], [3,1,1]>
  ]
>;

def FooSchedModel : SchedMachineModel {
  let Itineraries = FooItineraries;
}

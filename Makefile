LLVM_INCLUDE := llvm/include # llvm include directory
LLVM_TBLGEN  := llvm-tblgen  # llvm-tblgen tool

# output files
RECORDS = class.inc let.inc template.inc multiclass.inc foreach.inc

FOO_INC = FooGenRegisterInfo.inc \
          FooGenInstrInfo.inc \
          FooGenMCCodeEmitter.inc \
          FooGenMCPseudoLowering.inc \
          FooGenAsmMatcher.inc \
          FooGenAsmWriter.inc \
          FooGenDAGISel.inc \
          FooGenSubtargetInfo.inc \
          FooGenDisassemblerTables.inc \
          FooGenDFAPacketizer.inc

all: ${RECORDS} ${FOO_INC}

${RECORDS}: %.inc: Records/%.td
	${LLVM_TBLGEN} $< -o $@

FooGenRegisterInfo.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-register-info -o $@

FooGenInstrInfo.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-instr-info -o $@

FooGenMCCodeEmitter.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-emitter -o $@

FooGenMCPseudoLowering.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-pseudo-lowering -o $@

FooGenAsmMatcher.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-asm-matcher -o $@

FooGenAsmWriter.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-asm-writer -o $@

FooGenDAGISel.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-dag-isel -o $@

FooGenSubtargetInfo.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-subtarget -o $@

FooGenDisassemblerTables.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-disassembler -o $@

FooGenDFAPacketizer.inc: Foo/*.td
	${LLVM_TBLGEN} -I ${LLVM_INCLUDE} -I Foo Foo/Foo.td -gen-dfa-packetizer -o $@

clean:
	rm -f *.inc

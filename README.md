# TableGen Example

[TableGen](http://releases.llvm.org/8.0.1/docs/TableGen) simple examples written by xmj (mingjie@iscas.ac.cn).

- Records: shows the basic concepts of TableGen language.
- Foo: shows a simple target description.

## Prerequisites

The `llvm-tblgen` tool is needed to generate outputs, which is available under the llvm build directory.

The llvm source files is also needed by the Foo target description file.

## Generate outputs

Modify the Makefile, change the values of `LLVM_INCLUDE` and `LLVM_TBLGEN` to the correct ones in your host environment. Then run:

```
make
```

Or specify the values in the command:

```
make LLVM_TBLGEN=/path/to/the/llvm_tblgen LLVM_INCLUDE=/path/to/the/llvm/include
```

## Cleanup outputs

```
make clean
```

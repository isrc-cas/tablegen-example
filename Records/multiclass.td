class C<string n, bit v> {
  let NAME = n;
  bit Value = v;
}

multiclass MC<string n> {
  def _v0 : C<n, 0>;
  def _v1 : C<n, 1>;
}

defm X : MC<"x">;
defm Y : MC<"y">;


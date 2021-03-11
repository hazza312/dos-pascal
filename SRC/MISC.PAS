unit Misc;
interface
  function Min(a, b: integer): integer;
  function Max(a, b: integer): integer;
  procedure Swap(var i, j: integer);

implementation

  function Min(a, b: integer): integer;
  begin
    if a <= b then Min := a else Min := b;
  end;

  function Max(a, b: integer): integer;
  begin
    if a >= b then Max := a else Max := b;
  end;

  procedure Swap(var i, j: integer);
  var
    tmp: integer;

  begin
    tmp := i;
    i := j;
    j := tmp;
  end;

end.
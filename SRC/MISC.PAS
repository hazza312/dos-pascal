unit Misc;

interface
  function Min(a, b: integer): integer;
  function Max(a, b: integer): integer;

implementation

  function Min(a, b: integer): integer;
  begin
    if a <= b then Min := a else Min := b;
  end;

  function Max(a, b: integer): integer;
  begin
    if a >= b then Max := a else Max := b;
  end;

end.
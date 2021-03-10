program MaxSubArrayProgram;
uses
  Misc;


{ Kadane's algorithm }
function MaxSubArray(A: array of integer): integer;
var
  i, best, curr: integer;

begin
  best := Low(integer); curr := 0;

  for i := Low(A) to High(A) do
  begin
    curr := Max(A[i], curr+A[i]);
    best := Max(best, curr);
  end;

  MaxSubArray := best;
end;



{ some test cases }
const
  TC1: array[1..5] of integer = (1, 0, 2, 2, -1);
  TC2: array[1..1] of integer = (1);
  TC3: array[1..2] of integer = (1, -2);
  TC4: array[1..9] of integer = (-1, -1, 0, -1, -2, -9, -8, 1, -10);
  TC5: array[1..3] of integer = (-5, -4, -3);

begin
  writeln(MaxSubArray(TC1) = 5);
  writeln(MaxSubArray(TC2) = 1);
  writeln(MaxSubArray(TC3) = 1);
  writeln(MaxSubArray(TC4) = 1);
  writeln(MaxSubArray(TC5) = -3);
  readln;
end.
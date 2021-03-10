program Sort;
type
  TIntArray = array[0..1000] of integer;


procedure BubbleSort(A: array of integer);
var
  i, j, tmp: integer;

begin
  for i := Low(A) to High(A) do
    for j := Low(A) to High(A) -1 do
      if A[j] < A[j+1] then
      begin
        tmp := A[i];
        A[i] := A[j];
        A[j] := tmp;
      end;
end;


procedure MergeSort(var A: TIntArray);
var
  Tmp: TIntArray;

  procedure Merge(lo, mid, hi: integer);
  var
    i, j, out: integer;
  begin
    for i := lo to hi do
      Tmp[i] := A[i];

    i := lo; j := mid; out := lo;

    while out <= hi do
    begin
      if Tmp[i] <= Tmp[j] then
        begin  A[out] := Tmp[i];  i := i + 1; end
      else
        begin  A[out] := Tmp[j];  j := j + 1; end;

      out := out + 1;

      while (j > hi) and (i < mid) do
      begin
        A[out] := Tmp[i];
        out := out + 1;
        i := i + 1;
      end;

      while (i >= mid) and (j <= hi) do
      begin
        A[out] := Tmp[j];
        out := out + 1;
        j := j + 1
      end;
    end;
  end;

  procedure MergeRec(lo, hi: integer);
  var
    mid: integer;

  begin
    if lo = hi then
      exit;

    mid := (lo + hi) div 2;
    MergeRec(lo, mid);
    MergeRec(mid + 1, hi);
    Merge(lo, mid+1, hi);
  end;

begin
  MergeRec(Low(A), High(A));
end;


function IsSorted(A: array of integer): boolean;
var i: integer;
begin
  i := 0;
  IsSorted := true;

  for i := Low(A) to High(A)-1 do
    if A[i] > A[i+1] then
    begin
      IsSorted := false;
      break;
    end;
end;

var
  A: TIntArray;
  i: integer;

begin
  for i := Low(A) to High(A) do
    A[i] := Random(100);

  MergeSort(A);
  writeln(IsSorted(A));
  readln;

end.
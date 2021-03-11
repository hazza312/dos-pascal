program Sort;
uses
  Misc;


type
  TIntArray = array[0..100] of integer;



procedure BubbleSort(var A: TIntArray);
var
  i, j: integer;

begin
  for i := Low(A) to High(A) do
    for j := Low(A) to High(A) - 1 do
      if A[j] > A[j+1] then
        Swap(A[j], A[j+1]);

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
        begin
          A[out] := Tmp[i];
          Inc(i);
        end
      else
        begin
          A[out] := Tmp[j];
          Inc(j);
      end;

      Inc(out);


      if j > hi then
        while i < mid do
        begin
          A[out] := Tmp[i];
          Inc(out);
          Inc(i);
        end;

      if i >= mid then
        while j <= hi do
        begin
          A[out] := Tmp[j];
          Inc(out);
          Inc(j);
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



procedure QuickSort(var A: TIntArray);
  function Partition(lo, hi: integer): integer;
  var
    pivot, i, j: integer;

  begin
    pivot := A[(lo + hi) div 2];
    i := lo-1;
    j := hi+1;

    while true do
    begin
      repeat Inc(i) until A[i] >= pivot;
      repeat Dec(j) until A[j] <= pivot;

      if i >= j then
        break;

      Swap(A[i], A[j]);
    end;

    Partition := j;
  end;


  procedure QuickSortRec(lo, hi: integer);
  var
    pivot: integer;
  begin
    if lo >= hi then
      exit;

    pivot := partition(lo, hi);
    QuickSortRec(lo, pivot);
    QuickSortRec(pivot+1, hi);
  end;



begin
  QuickSortRec(Low(A), High(A));
end;



function IsSorted(A: array of integer): boolean;
var i: integer;
begin
  IsSorted := true;

  for i := Low(A) to High(A)-1 do
    if A[i] > A[i+1] then
    begin
      IsSorted := false;
      break;
    end;
end;



procedure RandomArray(var A: TIntArray);
var
  i: integer;

begin
  for i := Low(A) to High(A) do
    A[i] := Random(100);
end;


var
  A: TIntArray;
  i: integer;

begin
  RandomArray(A); MergeSort(A);  writeln('Merge sort: ', IsSorted(A));
  RandomArray(A); BubbleSort(A); writeln('Bubble sort: ', IsSorted(A));
  RandomArray(A); QuickSort(A);  writeln('Quicksort: ', IsSorted(A));
  readln;

end.
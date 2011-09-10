?- [library(clpfd)].

test :-
  test_4x4, test_6x6.

test_4x4 :-
  sudoku([_, _, 2, 3,
          _, _, _, _,
          _, _, _, _,
          3, 4, _, _],
          Solution),
  write_grid(Solution).

test_6x6 :-
  sudoku([3, _, _, _, _, 4,
          _, _, 4, 3, _, _,
          _, 3, _, _, 6, _,
          _, 4, _, _, 1, _,
          _, _, 2, 1, _, _,
          1, _, _, _, _, 2],
          Solution),
  write_grid(Solution).

valid([]).
valid([Head|Tail]) :-
  all_different(Head),
  valid(Tail).
sudoku(Puzzle, Solution) :-
  puzzleSize(Puzzle, Size),
  Solution = Puzzle,
  Solution ins 1..Size,
  getRows(Puzzle, Size, Rows),
  transpose(Rows, Columns),
  getSquares(Rows, Size, Squares),
  valid(Rows), valid(Columns), valid(Squares).

getRows([], _, []).
getRows(Puzzle, Size, [Row|Rows]) :-
  append(Row, Tail, Puzzle),
  length(Row, Size),
  getRows(Tail, Size, Rows).

getSquares([], _, []).
getSquares(Rows, Size, Squares) :-
  append(SquareRows, Tail, Rows),
  square_height_for_size(Size, SquareHeight),
  length(SquareRows, SquareHeight),
  transpose(SquareRows, ColumnsInRowOfSquares),
  getRowOfSquares(ColumnsInRowOfSquares, Size, RowOfSquares),
  append(RowOfSquares, NewSquares, Squares),
  getSquares(Tail, Size, NewSquares).

getRowOfSquares([], _, []).
getRowOfSquares(Columns, Size, [Square|Squares]) :-
  append(ColumnsInSquare, Tail, Columns),
  square_width_for_size(Size, SquareWidth),
  length(ColumnsInSquare, SquareWidth),
  append(ColumnsInSquare, Square),
  getRowOfSquares(Tail, Size, Squares).

square_width_for_size(4, 2).
square_width_for_size(6, 3).

square_height_for_size(4, 2).
square_height_for_size(6, 2).

puzzleSize(Puzzle, Size) :-
  length(Puzzle, Length),
  Size is round(sqrt(Length)).

write_grid(List) :-
  puzzleSize(List, Size),
  write_grid(List, Size).
write_grid([], Size) :-
  write_row_separator('└', '┴', '┘', Size).
write_grid(List, Size) :-
  append(Row, Tail, List),
  length(Row, Size),
  length(List, CellsRemaining),
  write_appropriate_row_separator(CellsRemaining, Size),
  write_row(Row),
  write_grid(Tail, Size).

write_row(Row) :-
  length(Row, Length),
  square_width_for_size(Length, SquareWidth),
  write('│'),
  write_square_rows(Row, SquareWidth),
  writeln('').

write_square_rows([], _).
write_square_rows(Row, SquareWidth) :-
  append(SquareRow, Tail, Row),
  length(SquareRow, SquareWidth),
  write_square_row(SquareRow),
  write_square_rows(Tail, SquareWidth).

write_square_row([Cell|[]]) :-
  write(Cell), write('│').
write_square_row([Cell, Next|Tail]) :-
  write(Cell), write(' '),
  write_square_row([Next|Tail]).

write_appropriate_row_separator(CellsRemaining, Size) :-
  CellsRemaining =:= Size ** 2,
  write_row_separator('┌', '┬', '┐', Size).
write_appropriate_row_separator(CellsRemaining, Size) :-
  square_height_for_size(Size, SquareHeight),
  CellsRemaining mod (SquareHeight * Size) =:= 0, write_row_separator('├', '┼', '┤', Size); true.

write_row_separator(LeftChar, MiddleChar, RightChar, Size) :-
  write(LeftChar),
  write_row_separator(MiddleChar, Size, Size),
  writeln(RightChar).

write_row_separator(_, 1, _) :-
  write('─').
write_row_separator(MiddleChar, CellsRemaining, Size) :-
  square_width_for_size(Size, SquareWidth),
  CellsRemaining mod SquareWidth =:= 1,
  write('─'),
  write(MiddleChar),
  NewCellsRemaining is CellsRemaining - 1,
  write_row_separator(MiddleChar, NewCellsRemaining, Size).
write_row_separator(MiddleChar, CellsRemaining, Size) :-
  write('──'),
  NewCellsRemaining is CellsRemaining - 1,
  write_row_separator(MiddleChar, NewCellsRemaining, Size).

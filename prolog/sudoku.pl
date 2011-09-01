?- [library(clpfd)].

valid([]).
valid([Head|Tail]) :-
  all_different(Head),
  valid(Tail).
sudoku(Puzzle, Solution) :-
  Solution = Puzzle,
  Puzzle = [S11, S12, S13, S14,
            S21, S22, S23, S24,
            S31, S32, S33, S34,
            S41, S42, S43, S44],
  Solution ins 1..4,
  Row1 = [S11, S12, S13, S14],
  Row2 = [S21, S22, S23, S24],
  Row3 = [S31, S32, S33, S34],
  Row4 = [S41, S42, S43, S44],
  Col1 = [S11, S21, S31, S41],
  Col2 = [S12, S22, S32, S42],
  Col3 = [S13, S23, S33, S43],
  Col4 = [S14, S24, S34, S44],
  Square1 = [S11, S12, S21, S22],
  Square2 = [S13, S14, S23, S24],
  Square3 = [S31, S32, S41, S42],
  Square4 = [S33, S34, S43, S44],
  valid([Row1, Row2, Row3, Row4,
         Col1, Col2, Col3, Col4,
         Square1, Square2, Square3, Square4]).

square_width_for_size(4, 2).
square_height_for_size(4, 2).

write_grid([], _) :-
  writeln('└───┴───┘').
write_grid(List, Size) :-
  append(Row, Tail, List),
  length(Row, Size),
  length(List, CellsRemaining),
  write_row_separator(CellsRemaining, Size),
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

write_row_separator(CellsRemaining, Size) :-
  CellsRemaining =:= Size ** 2,
  writeln('┌───┬───┐').
write_row_separator(CellsRemaining, Size) :-
  CellsRemaining < Size ** 2,
  square_height_for_size(Size, SquareHeight),
  CellsRemaining mod (SquareHeight * Size) =:= 0, writeln('├───┼───┤'); true.

test :-
  sudoku([_, _, 2, 3,
          _, _, _, _,
          _, _, _, _,
          3, 4, _, _],
          Solution),
  write_grid(Solution, 4).

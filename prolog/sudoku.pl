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

write_grid([], _) :-
  writeln('└───┴───┘').
write_grid(List, Size) :-
  append(SetOfRows, Tail, List),
  append(Row1, Row2, SetOfRows),
  length(Row1, Size),
  length(Row2, Size),
  write_row_separator(List),
  write_row(Row1),
  write_row(Row2),
  write_grid(Tail, Size).

write_row(Row) :-
  [A, B, C, D] = Row,
  write('│'), write(A), write(' '), write(B), write('│'),
  write(C), write(' '), write(D),  writeln('│').

write_row_separator(RemainingCells) :-
  length(RemainingCells, 16), writeln('┌───┬───┐') ; writeln('├───┼───┤').

test :-
  sudoku([_, _, 2, 3,
          _, _, _, _,
          _, _, _, _,
          3, 4, _, _],
          Solution),
  write_grid(Solution, 4).

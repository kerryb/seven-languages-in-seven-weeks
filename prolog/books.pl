#!/usr/bin/env swipl -qt main -s

author('Harry Potter and the Philosopher\'s Stone', 'JK Rowling').
author('Winnie the Pooh', 'AA Milne').
author('XP Explained', 'Kent Beck').

genre('Harry Potter and the Philosopher\'s Stone', 'Children\'s fiction').
genre('Winnie the Pooh', 'Children\'s fiction').
genre('XP Explained', 'Technical').

technicalBook(X) :-
  genre(X, 'Technical').

childrensAuthor(X) :-
  author(Y, X),
  genre(Y, 'Children\'s fiction').

main :-
  listTechnicalBooks,
  listChildrensAuthors,
  false.

listTechnicalBooks :-
  write('Technical books:'), nl,
  technicalBook(X),
  writeItem(X).

listChildrensAuthors :-
  write('Children\'s authors:'), nl,
  childrensAuthor(Y),
  writeItem(Y).

writeItem(X) :-
  write('  '), write(X), nl.

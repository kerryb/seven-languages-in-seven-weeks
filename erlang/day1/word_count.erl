-module(word_count).
-export([word_count/1]).
-include_lib("eunit/include/eunit.hrl").

word_count(A) -> word_count(not_in_word, re:replace(A, "\\s+", " ", [global, {return, list}])).
word_count(_, "") -> 0;
word_count(_, " " ++ T) -> word_count(not_in_word, T);
word_count(not_in_word, [_|T]) -> 1 + word_count(in_word, T);
word_count(in_word, " " ++ T) -> word_count(not_in_word, T);
word_count(in_word, [_|T]) -> word_count(in_word, T).

word_count_empty_string_test() -> 0 = word_count("").
word_count_single_word_test() -> 1 = word_count("foo").
word_count_two_words_test() -> 2 = word_count("foo bar").
word_count_leading_whitespace_test() -> 1 = word_count(" foo").
word_count_trailing_whitespace_test() -> 1 = word_count("foo ").
word_count_multiple_spaces_test() -> 2 = word_count("foo   bar").
word_count_just_whitespace_test() -> 0 = word_count(" \n\t  \n").
word_count_tab_test() -> 2 = word_count("foo\tbar").
word_count_newline_test() -> 2 = word_count("foo\nbar").
word_count_tab_and_newline_test() -> 2 = word_count("foo\t\nbar").
word_count_allsorts_test() -> 4 = word_count("\n foo \n\n  \tbar\t\f \tbaz\r\n\tquz \t").

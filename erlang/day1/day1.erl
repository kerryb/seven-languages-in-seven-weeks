-module(day1).
-export([word_count/1]).
-include_lib("eunit/include/eunit.hrl").

word_count("") -> 0;
word_count("\n" ++ T) -> word_count(" " ++ T);
word_count("\t" ++ T) -> word_count(" " ++ T);
word_count("  " ++ T) -> word_count(" " ++ T);
word_count(" " ++ T) -> 1 + word_count(T);
word_count([_]) -> 1;
word_count([_|T]) -> word_count(T).

word_count_empty_string_test() -> 0 = word_count("").
word_count_single_word_test() -> 1 = word_count("foo").
word_count_two_words_test() -> 2 = word_count("foo bar").
word_count_multiple_spaces_test() -> 2 = word_count("foo   bar").
word_count_tab_test() -> 2 = word_count("foo\tbar").
word_count_newline_test() -> 2 = word_count("foo\nbar").

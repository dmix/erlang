-module(useless).

-export([
	add/2,
	hello/1,
	greet_and_add_two/2
]).


hello(Name) ->
	io:format("Hello world ~s!!!!~n", [Name]).


greet_and_add_two(X, Name) ->
	hello(Name),
	useless:add(four, 2).


add(four, X) ->
	io:format("Hello world ~s!!!~n", [X]);
add(two, X) ->
	io:format("Hello world ~s!!!!~n", [X]).

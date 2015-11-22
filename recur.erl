-module(recur).
-export([duplicate/2, tail_duplicate/2, reverse/1, tail_reverse/1,
		 sublist/2, tail_sublist/2, zip/2]).


duplicate(0, _) ->
	[];
duplicate(N, Term) when N > 0 ->
	[Term|duplicate(N-1,Term)].


tail_duplicate(N, Term) ->
	tail_duplicate(N, Term, []).

tail_duplicate(0, _, List) ->
	List;
tail_duplicate(N,Term,List) when N > 0 ->
	tail_duplicate(N-1, Term, [Term|List]).


reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).


sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 -> [H|sublist(T,N-1)].

tail_sublist(L, N) -> tail_reverse(tail_sublist(L, N, [])).}

tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
	tail_sublist(T, N-1, [H|SubList]).


zip([], []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X, Y}|zip(Xs, Ys)].

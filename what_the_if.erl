-module(what_the_if).

-export([oh_god/1]).
-export([help_me/1]).
-export([insert/2]).
-export([beach/1]).
-export([heh_fine/0]).


heh_fine() ->
	if 1 =:= 1 ->
		works
	end,
	if 1 =:= 2; 1 =:= 1 ->
		works
	end,
	if 1 =:= 2, 1 =:= 1 ->
		fails
	end.


oh_god(N) ->
	if N =:= 2 -> might_succeed;
		true -> always_does %% this is erlangs if else
	end.


help_me(Animal) ->
	Talk = if Animal == cat  -> "meow";
			  Animal == beef -> "mooo";
			  Animal == dog  -> "bark";
			  Animal == tree -> "bark";
			  true   -> "sdasdaads"
     	   end,
	{Animal, "says " ++ Talk ++ "!"}.


insert(X,[]) ->
	[X];
insert(X,Set) ->
	case lists:member(X,Set) of
		true  -> Set;
		false -> [X|Set]
	end.


beach(Tempature) ->
	case Tempature of
		{celsius, N} when N >= 20, N =< 45 ->
			'favorable';
		{kelvin, N} when N >= 293, N =< 318 ->
			'scientifically favorable';
		{fahrenheight, N} when N >= 68, N =< 113 ->
			'favorable in the US';
		_ ->
			'avoid beach'
	end.

beachf({celsius, N}) when N >= 20, N =< 45 ->
	'favorable';
beachf(_) ->
	'avoid beach'.


and(false, _) -> false;
and(_, false) -> false;
and(true, true) -> true;

-module(functions).
-export([count/2, countall/2, reverse/1, twist/1, twist/2, insertion_sort/1]).

%% count
count(X, L) -> lists:foldl(fun(B, Sum) -> B + Sum end, 0, [1 || A <- L, A=:=X]).

%% countall
countall(X, L) -> lists:foldl(fun(B, Sum) -> B + Sum end, 0, [1 || A <- lists:flatten(L), A=:=X]).

%% reverse
reverse(L) -> lists:foldl(fun(A, Rev) -> [A] ++ Rev end, [], L).

%% twist
twist(L) -> twist(L, []).
twist([H|T], Result) ->
    case H of
        [_|_] -> twist(T, [twist(H)] ++ Result);
        _ -> twist(T, [H] ++ Result)
    end;
twist([], Result) -> Result.

%% insertion_sort
insertion_sort(L) -> lists:foldl(fun insertion/2, [], L).

insertion(X, []) -> [X];
insertion(X,L=[H|_]) when X =< H -> [X|L];
insertion(X,[H|T]) -> [H|insertion(X, T)].

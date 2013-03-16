-module(fe_tests).
-include_lib("eunit/include/eunit.hrl").

true_test() -> true = fe:true().
false_test() -> false = fe:false().

all_test_() ->
    AllT = fe:all([fun fe:true/0, fun fe:true/0]),
    OneF = fe:all([fun fe:true/0, fun fe:false/0]),

    [
        { "all true means the composite is true",
            ?_assertMatch(true, AllT()) },

        { "one false means the composite is false",
            ?_assertMatch(false, OneF()) }
    ].

any_test_() ->
    AnyT = fe:any([fun fe:true/0, fun fe:false/0]),
    None = fe:any([fun fe:false/0, fun fe:false/0]),

    [
        { "true if any are true", ?_assertMatch(true, AnyT()) },
        { "false if none are true", ?_assertMatch(false, None()) }
    ].

count_test_() ->
    { "returns the count of needles", 
        ?_assertMatch(2, fe:count(2, [1,4,2,4,2])) }.
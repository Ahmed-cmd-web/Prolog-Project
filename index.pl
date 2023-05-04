


count([],0,_).

count([X|T],N,X):-
    count(T,N1,X),
    N is N1+1.

count([X|T],N,Y):-
    Y \= X,
    count(T,N,Y).


slot_assignment_helper(0,L,Acc,L3,[]):- append(L,Acc,L3).

slot_assignment_helper(N,[ta(Name,Load)|T],Acc,RemTAs,[Name|NewAss]):-
    N1 is N -1,
    ta_slot_assignments([ta(Name,Load)|T],[E|_],Name),
    append([E],Acc,NewAcc),
    slot_assignment_helper(N1,T,NewAcc,RemTAs,NewAss).




ta_slot_assignments([ta(Name,L)|T],[ta(Name,L1)|T],Name):-
    L1 is L - 1.

ta_slot_assignments([H|T],[H|T1],Name):-
    ta_slot_assignments(T,T1,Name).


slot_assignment(N,L,RemTAs,Ass):-
    permutation(L, L2),
    slot_assignment_helper(N,L2,[],RemTAs,Ass).

max_slots_per_day(Sched,M):-
    flatten(Sched,NewSched),
    max_slots_per_dayh(NewSched,M).

max_slots_per_dayh([],_).

max_slots_per_dayh([H|T],M):-
    count([H|T],N,H),
    N=<M,
    max_slots_per_dayh(T,M).

day_schedule(DaySlots,TAs,RemTAs,Assignment):-
    day_scheduleh(DaySlots,TAs,[],RemTAs,Assignment).

day_scheduleh([],_,Acc,Acc,[]).
day_scheduleh([S|Rs],TAs,_,V,[SAss|Ass]):-
    slot_assignment(S,TAs,NewRemTAs,SAss),
    day_scheduleh(Rs,NewRemTAs,NewRemTAs,V,Ass).

week_schedule(Slots,TAs,DayMax,Sched):-
    week_scheduleh(Slots,TAs,DayMax,Sched).


week_scheduleh([],_,_,[]).

week_scheduleh([D|RW],TAs,DayMax,[Assignment|T]):-
    day_schedule(D,TAs,RemTAs,Assignment),
    max_slots_per_day(Assignment,DayMax),
    week_scheduleh(RW,RemTAs,DayMax,T).

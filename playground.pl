% % slot_assignment(0,L,Acc,[]).


% % slot_assignment(N,[ta(Name,Load)|T],_,[Name|T2]):-
% %     N1 is N -1,
% %     ta_slot_assignments([ta(Name,Load)|T],[K|T3],Name),

% %     slot_assignment(N1,T,T3,T2).


% % slot_assignment(3, [ta(y, 4), ta(h, 7), ta(r, 8), ta(s, 8)],RemTAs,Assignment).

% % flatten(lss, lksd)

% % day_schedule([2, 1, 2, 3, 0], [ta(y, 4), ta(h, 7), ta(r, 8), ta(s, 8)],RemTAs,Assignment).
% % count([y,y,y,y,z,x,f],N,y).
%  day_schedule([2, 1], [ta(y, 4), ta(h, 7)],RemTAs,Assignment).

% week_schedule= [ [[], [], [], [], []],
% [[r, y], [y], [r, h], [r, h, y], []],
% [[h, y], [] , [h] , [h, s] , []],
% [[], [s], [s], [], []],
% [[s], [], [], [s, r], [s, r]],
% [[h, r], [s], [r, h, s], [r], []]
% ].


% week_schedule([ [0, 0, 0, 0, 0], [2, 1, 2, 3, 0],[2, 0, 1, 2, 0] , [0, 1, 1, 0, 0] , [1, 0, 0, 2, 2] ,[2, 1, 3, 1, 0] ], [ta(y, 4), ta(h, 7), ta(r, 8), ta(s, 8)],3,S).

% week_schedule([ [0, 0],[1, 1],[2, 0],[0,1],[1,0],[1, 1]], [ta(y, 4), ta(h, 7)],2,S).



% slot_assignment(3, [ta(y, 4), ta(h, 7)],RemTAs,Assignment).


count([],0,_).

count([X|T],N,X):-
    count(T,N1,X),
    N is N1+1.

count([X|T],N,Y):-
    Y \= X,
    count(T,N,Y).


ta_slot_assignments([ta(Name,L)|T],[ta(Name,L1)|T],Name):-
    L1 is L - 1.

ta_slot_assignments([ta(Name2,Load)|T],[ta(Name2,Load)|L],Name):-
    ta_slot_assignments(T,L,Name),
    Name2 \= Name.



slot_assignment_helper(0,L,Acc,L3,[]):-
    append(Acc,L,L3).



slot_assignment_helper(N,[V|T],Acc,RemTAs,[Name|NewAss]):-
    permutation(NewAss,NNA),
    ta_slot_assignments([V|T],[E|_],Name),
    append([E],Acc,NewAcc),
    N1 is N -1,
    slot_assignment_helper(N1,T,NewAcc,RemTAs,NNA).



slot_assignment(N,L,RemTAs,Ass):-
    slot_assignment_helper(N,L,[],RemTAs,Ass).
    % permutation(Ass,NewAss),
    % is_set(Ass).
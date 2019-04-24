% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.


% 1st problem
% Einstein's enigma-style problem

solve(S) - S = [_,_,_,_,_],
nationality(O1,englishman),color(O1,red),member(O1,S),
color(O2,green),drink(O2,coffee),member(O2,S),
nationality(O3,italian),drink(O3,tea),member(O3,S),
color(O4,yellow),cigarette(O4,kent),member(O4,S),
drink(O5,milk),middle(O5,S),
nationality(O6,russian),leftmost(O6,S),
cigarette(OA7,marlboro),pet(OB7,fox),near(OA7,OB7,S),
cigarette(OA8,kent),pet(OB8,horse),near(OA8,OB8,S),
drink(O9,juice),cigarette(O9,pall_mall),member(O9,S),
nationality(O10,japanese),cigarette(O10,assos),member(O10,S),
nationality(OA11,russian),color(OB11,blue),near(OA11,OB11,S),
nationality(O12,spanish),pet(O12,dog),member(O12,S),
pet(O13,snake),cigarette(O13,camel),member(O13,S),
color(OA14,gray),color(OB14,green),near(OA14,OB14,S),
pet(OA15,cat),drink(OB15,vodka),lateral(OA15,S),lateral(OB15,S).
color([Color,_,_,_,_],Color).
nationality([_,Nationality,_,_,_],Nationality).
drink([_,_,Drink,_,_],Drink).
cigarette([_,_,_,Cigarette,_],Cigarette).
pet([_,_,_,_,Pet],Pet).
leftmost(X,[X,_,_,_,_]).
middle(X,[_,_,X,_,_]).
lateral(X,[X,_,_,_,_]).
lateral(X,[_,_,_,_,X]).
left(A,B,S) -
append(_,[A,B_],S).
near(A,B,S) -
left(A,B,S).
near(A,B,S) -
left(B,A,S).


% 2nd problem

% Consider a road with four cities (A, B, C, D) lying along its side. We have no
% lue about
% how they are ordered, however, we know the distance from A to C is
% bigger than the
% distance from C to D and the distance from B to C is smaller than the
% distance from B to
% D. Write a Prolog program that figures out how the four cities are
% ordered (the distance
% between two consecutive towns is the same).

dist(A,B,S,D) -
    nth0(X1,S,A),
    nth0(X2,S,B),
    D is abs(X1-X2).

city(S) -
    S = [_,_,_,_],
    dist(a,c,S,K1),
    dist(c,d,S,K2),
    K1  K2,
    dist(b,c,S,K3),
    dist(b,d,S,K4),
    K3  K4.


% 3rd problem

% A man was held prisoner by a great emperor and convicted to death. The
% emperor de%cided
% to give him a chance to survive if he was able to solve a riddle. The
% man was put in a room with two doors, each of them wearing a label and
% leading to a secret cell. But the
% labels were not to be trusted. They could either tell the truth, or
% lie. The emperor added
% a bonus label, which was known to be true unconditionally, because the
% emperor was a
% very honest man. Here are the three labels
% • First door label said this cell contains a princess and the other
% cell contains a
%tiger
% • Second door label said one cell contains a tiger and the other cell
% contains a
% princess
% • The emperor added one label is true and the other is false.

door1(S) - S = [princess, tiger].
door2(S) - S = [princess, tiger]; S = [tiger, princess].
correct_door(S) -
    S = [_,_],
    door1(S), not(door2(S));
    door2(S), not(door1(S)).
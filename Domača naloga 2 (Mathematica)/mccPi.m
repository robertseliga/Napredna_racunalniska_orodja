(* ::Package:: *)

mccPi[T_]:=Module[{x,y,tocke,notkrog,allPoints},
x=RandomReal[{-1,1},T];(*generiranje naklju\[CHacek]nih to\[CHacek]k znotraj kvadtata [-1,1]*)
y=RandomReal[{-1,1},T];
tocke=Transpose[{x,y}];(*matrika*)
notkrog=Select[tocke,Norm[#]<=1&];(*to\[CHacek]ke znotraj kroga*)
{notkrog,tocke}](*to\[CHacek]ke kroga in vse to\[CHacek]ke v obliki seznama*)

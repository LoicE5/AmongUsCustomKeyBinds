FileEncoding UTF-8

#IfWinActive, Among Us
{
z::w
q::a
f::q
e::r
Shift::Esc
a::k
w::k
&::sabotage("sabotage/elec2.jpg")	;
'::sabotage("sabotage/comm.jpg")	;
SC003::sabotage("sabotage/o2.jpg")	;
"::sabotage("sabotage/reactor.jpg")	;
t::Click, 33, 127  ;
c::Click, 1513, 125  ;
#F1::Suspend  ;
return
}

sabotage(path){
CoordMode Pixel  ;
send, {Space down}
send, {Space up}
sleep, 100
ImageSearch, FoundX, FoundY, 0,0, 1920,1080, *110 *TransBlack %path%
if (ErrorLevel = 0)
    Click, %FoundX%, %FoundY%  ;
sleep, 100
send, {Esc down}
send, {Esc up}
}

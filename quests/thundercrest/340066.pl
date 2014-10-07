##Yar'Lir event 2 of possible 3 NPC ID 340066##
sub EVENT_SPAWN {

 quest::setnexthpevent(50);

 }

sub EVENT_HP {
 quest::spawn2(340063,0,0,-3504.1,3015,292.5,9.2);
 quest::spawn2(340063,0,0,-3500.4,3279.7,292.5,120.1);
 quest::spawn2(340063,0,0,-3346.8,3117.7,292.5,206.2);
 quest::spawn2(340063,0,0,-3621.4,3163.8,292.5,70);
 }

sub EVENT_DEATH {
quest::signalwith(340063,500,0);
quest::spawn(340067,0,0,-3423.9,3148.5,300.9,197.4); 
}
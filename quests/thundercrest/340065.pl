##Yar'Lir event 3 of possible 3 NPC ID 340065##
sub EVENT_SPAWN {

 quest::setnexthpevent(66);

 }

sub EVENT_HP {

 quest::spawn2(340063,0,0,-3504.1,3015,292.5,9.2);
 quest::spawn2(340063,0,0,-3500.4,3279.7,292.5,120.1);
 quest::spawn2(340063,0,0,-3346.8,3117.7,292.5,206.2);
 quest::spawn2(340063,0,0,-3621.4,3163.8,292.5,70);
 quest::spawn2(340064,0,0,-3463,3009,292.5,253.9);
 quest::spawn2(340064,0,0,-3472,3277,292.5,127.4);
 quest::spawn2(340064,0,0,-3349,3144.7,292.5,197.6);
 quest::spawn2(340064,0,0,-3623.2,3129,292.5,59.8);
 }
 }
sub EVENT_DEATH {
quest::signalwith(340063,500,0);
quest::signalwith(340064,500,0);
quest::spawn(340067,0,0,-3423.9,3148.5,300.9,197.4); 
}
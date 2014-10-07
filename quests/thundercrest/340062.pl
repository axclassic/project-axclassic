##Yar'Lir event 1 of possible 3 NPC ID 340062##
sub EVENT_SPAWN {

 quest::setnexthpevent(50);

 }

sub EVENT_HP {
 quest::spawn2(340064,0,0,-3463,3009,292.5,253.9);
 quest::spawn2(340064,0,0,-3472,3277,292.5,127.4);
 quest::spawn2(340064,0,0,-3349,3144.7,292.5,197.6);
 quest::spawn2(340064,0,0,-3623.2,3129,292.5,59.8);
 }

sub EVENT_DEATH {
quest::signalwith(340064,500,0);
quest::spawn(340067,-3423.9,3148.5,300.9,197.4); 
}
##Yar'Lir event 2 of possible 3 NPC ID 340066##
sub EVENT_SPAWN {

 quest::setnexthpevent(50);

 }

sub EVENT_HP {
 quest::spawn2(340063,0,0,-3434.9,3163.6,301.1,183.8);
 quest::spawn2(340063,0,0,-3509.7,3194.7,301.1,91.5);
 quest::spawn2(340063,0,0,-3536.9,3125.4,301.1,37.1);
 quest::spawn2(340063,0,0,-3466.3,3093.3,301.1,236.8);
 }

sub EVENT_DEATH {
quest::signalwith(340063,500,0);
quest::spawn(340067,0,0,-3513.7,3181.5,299.9,93); 
}
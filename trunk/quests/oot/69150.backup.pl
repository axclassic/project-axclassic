## BOAT WATCHER!!
## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar
sub EVENT_SPAWN { ## Starts in oot

#quest::shout("Just spawned... sirens is $sirens");

if (($sirens ==14) && ($sirens >=14) && ($sirens <=38)){ ##oot
 quest::spawn_condition("oot",2,0); #BoatThere
 quest::spawn_condition("oot",1,1);
 quest::spawn_condition("oot",3,0);
 quest::depop();}
elsif($sirens == 60){
 quest::spawn_condition("oot",2,0); #BoatFromFPThere
 quest::spawn_condition("oot",1,0);
 quest::spawn_condition("oot",3,1);
 quest::depop();}
else{
 quest::spawn_condition("oot",2,1); #BoatGone
 quest::spawn_condition("oot",1,0);
 quest::spawn_condition("oot",3,0);
 quest::depop();}}


## SirensBane travels from butcher to oot to freporte and back
## Angelox
## Qadar
sub EVENT_SPAWN { ## Starts in Butcher
no warnings 'all' ;
#quest::shout("I currently see sirens set at $sirens");
if (($sirens ==0) && ($sirens <=13)){ ##butcher
 quest::spawn_condition(butcher, 2,0); #BoatThere
 quest::spawn_condition(butcher, 1,1);}
elsif($sirens <= 13){
 quest::spawn_condition(butcher, 2,1); #BoatGone
 quest::spawn_condition(butcher, 1,0);
 quest::depop();}
elsif($sirens >= 14){  #boat is not in zone
 quest::spawn_condition(butcher, 2,1); #BoatGone
 quest::spawn_condition(butcher, 1,0);
 quest::depop();}}


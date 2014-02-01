## SirensBane travels from butcher to oot to freporte and back
## Angelox
## Qadar
sub EVENT_SPAWN { ## Starts in Butcher
no warnings 'all' ;
### START CODE TO MOVE STUCK BOATS ###

#if($debugpl) {quest::shout("I currently see Stormbreaker's position set at $sirens");}
if($forceboats){
if($butcherlastseen==$sirens){   #boat hasnt changed waypoints yet

  ### CHANGE THESE VALUES TO ADJUST THE START POINTS FOR EACH ZONE ###

  $butcherstart = 0;         # what $sirens is set at to start the boat in Butcher
  $oot1start =   14;         # what $sirens is set at to start the boat in OOT to Freeport
  $fpstart =     37;         # what $sirens is set at to start the boat in Freeport
  $oot2start=    60;         # what $sirens is set at to start the boat in OOT heading to Butcher
no warnings 'all' ;
  ### CHANGE THESE VALUES TO ADJUST THE TIME IT TAKES BEFORE THE BOAT IS MOVED

  $oot1wait =    10;         # number of spawns before it assumes boat in OOT to FP is stuck
  $fpwait =      10;         # number of spawns before it assumes boat in FP is stuck
  $oot2wait =    10;         # number of spawns before it assumes boat in OOT to Butcher is stuck
  $butcherwait = 10;         # number of spawns before it assumes boat in OOT to Butcher is stuck

  if(($sirens>=$oot1start) && ($sirens < $fpstart) && ($butchertimer >= $oot1wait)){        #if waypoint hasnt changed in 15 spawns, and boat in oot on its way to fp
    #if($debugpl){quest::shout("Stormbreaker is in OOT heading to Freeport, hasn't moved, giving up and moving it to Freeport");}
    quest::delglobal("sirens");  #boat obviously isnt moving... move it to fp
    quest::setglobal("sirens",$fpstart,7,"F");}
  elsif(($sirens>=$fpstart) && ($sirens < $oot2start) && ($butchertimer >= $fpwait)){        #if waypoint hasnt changed in 15 spawns, and boat in freeport
    #if($debugpl){quest::shout("Stormbreaker is in Freeport, hasnt moved, giving up and moving it to oot");}
    quest::delglobal("sirens");  #boat obviously isnt moving... move it to oot
    quest::setglobal("sirens",$oot2start,7,"F");}
  elsif(($sirens>=$oot2start) && ($butchertimer >= $oot2wait)){        #if waypoint hasnt changed in 15 spawns, and boat in oot on its way to bb
    #if($debugpl){quest::shout("Stormbreaker is in OOT heading here... hasnt moved, giving up and moving it to butcher");}
    quest::delglobal("sirens");  #boat obviously isnt moving... move it to butcher
    quest::setglobal("sirens",$butcherstart,7,"F");}
  elsif(($sirens>=$butcherstart) && ($sirens < $oot1start) && ($butchertimer >= $butcherwait)){
    #if($debugpl){quest::shout("Stormbreaker is in Butcher heading to OOT... hasnt moved, giving up and moving it to OOT");}
    quest::delglobal("sirens");  #boat obviously isnt moving... move it to oot
    quest::setglobal("sirens",$oot1start,7,"F");}
  else{                           #increase the timer
    $tempvar = $butchertimer+1;
    #if($debugpl){quest::shout("Stormbreaker hasn't moved, increasing timer to $tempvar");}
    quest::delglobal("butchertimer");
    quest::setglobal("butchertimer",$tempvar,3,"F");}
}else{                          #boat has changed waypoints, tell butcherlastseen its new waypoint, reset timer to 0
  #if($debugpl){quest::shout("Stormbreaker seems to be moving ok");}
  quest::delglobal("butcherlastseen");
  quest::setglobal("butcherlastseen",$sirens,3,F);
  $butcherlastseen = undef;
  quest::delglobal("butchertimer");
  quest::setglobal("butchertimer",0,3,7);
  $butchertimer = undef;}}

### END CODE TO MOVE STUCK BOATS ###


if (($sirens ==0) && ($sirens <=13)){ ##butcher
 quest::spawn_condition("butcher", 2,0); #BoatThere
 quest::spawn_condition("butcher", 1,1);}
elsif($sirens <= 13){
 quest::spawn_condition("butcher", 2,1); #BoatGone
 quest::spawn_condition("butcher", 1,0);
 quest::depop();}
elsif($sirens >= 14){  #boat is not in zone
 quest::spawn_condition("butcher", 2,1); #BoatGone
 quest::spawn_condition("butcher", 1,0);
 quest::depop();}}

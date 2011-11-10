## BOAT WATCHER!!
## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar
sub EVENT_SPAWN { ## Starts in Oot

# --- START CODE FOR BOAT MOVER --- #

if($debugpl) {quest::shout("I currently see Stormbreaker's position set at $sirens");}
if($forceboats){
  if($freportelastseen==$sirens){   #boat hasnt changed waypoints yet

    $butcherstart = 0;                  # what $sirens is set at to start the boat in Butcher
    $oot1start = 14;                    # what $sirens is set at to start the boat in OOT to Freeport
    $fpstart = 39;                      # what $sirens is set at to start the boat in Freeport
    $oot2start= 60;                     # what $sirens is set at to start the boat in OOT heading to Butcher

    $oot1wait = 40;                     # number of spawns before it assumes boat in OOT to FP is stuck
    $fpwait = 40;                       # number of spawns before it assumes boat in FP is stuck
    $oot2wait = 40;                     # number of spawns before it assumes boat in OOT to Butcher is stuck
    $butcherwait = 40;                  # number of spawns before it assumes boat in Butcher is stuck
    
    if(($sirens>=$oot1start) && ($sirens < $fpstart) && ($freportetimer >= $oot1wait)){        #if waypoint hasnt changed in x spawns, and boat in oot on its way to fp
      if($debugpl){quest::shout("Stormbreaker is in OOT heading to Freeport, hasn't moved, giving up and moving it to Freeport");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to fp
      quest::setglobal("sirens",$fpstart,7,"F");}
    elsif(($sirens>=$fpstart) && ($sirens < $oot2start) && ($freportetimer >= $fpwait)){        #if waypoint hasnt changed in x spawns, and boat in freeport
      if($debugpl){quest::shout("Stormbreaker is in Freeport, hasnt moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to oot
      quest::setglobal("sirens",$oot2start,7,"F");}
    elsif(($sirens>=$oot2start) && ($freportetimer >= $oot2wait)){        #if waypoint hasnt changed in x spawns, and boat in oot on its way to bb
      if($debugpl){quest::shout("Stormbreaker is in OOT heading to Butcher... hasnt moved, giving up and moving it to butcher");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to butcher
      quest::setglobal("sirens",$butcherstart,7,"F");}
    elsif(($sirens>=$butcherstart) && ($sirens < $oot1start) && ($freportetimer >= $butcherwait)){   #if waypoint hasnt changed in 15 spawns, and boat in butcher on its way to freeport
      if($debugpl){quest::shout("Stormbreaker is in Butcher heading to OOT... hasnt moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to OOT
      quest::setglobal("sirens",$oot1start,7,"F");}
    else{                           #increase the timer
      $tempvar = $freportetimer+1;
      if($debugpl){quest::shout("Stormbreaker hasn't moved, increasing timer to $tempvar");}
      quest::delglobal("freportetimer");
      quest::setglobal("freportetimer",$tempvar,3,"F");}
  }else{                          #boat has changed waypoints, tell freportelastseen its new waypoint, reset timer to 0
    if($debugpl){quest::shout("Stormbreaker seems to be moving ok");}
    quest::delglobal("freportelastseen");
    quest::setglobal("freportelastseen",$sirens,3,F);
    $freportelastseen = undef;
    quest::delglobal("freportetimer");
    quest::setglobal("freportetimer",0,3,7);
    $freportetimer = undef;}}

# --- END : CODE FOR BOAT MOVER --- #


if (($sirens ==39) &&($sirens >=39) && ($sirens <=59)){ ##Oot
 quest::spawn_condition(freporte,2,0); #BoatThere
 quest::spawn_condition(freporte,1,1);
 # quest::shout ("Boat there");
 quest::depop();}
else{
 quest::spawn_condition(freporte,2,1); #BoatGone
 quest::spawn_condition(freporte,1,0);
# quest::shout ("Not there");
 quest::depop();}}


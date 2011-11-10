## INVISIBLE ONE!!
## SirensBane travels from oot to oot to butcher and back
## Angelox
## Qadar

sub EVENT_SPAWN{
### This initializes the boat globals if they're not already there.
if ($sirens lt 0) { 
      quest::setglobal("sirens",0,7,"F");
      quest::setglobal("skiffa",0,7,"F");
      quest::setglobal("skiffb",0,7,"F");
      quest::setglobal("skiffc",0,7,"F");
      quest::setglobal("shuta",0,7,"F");
      quest::setglobal("shutb",0,7,"F");
      quest::setglobal("shutc",0,7,"F");
      quest::setglobal("maidna",0,7,"F");
      quest::setglobal("maidnb",0,7,"F");
      quest::setglobal("maidnc",0,7,"F");}
}

### Mover script:  Moves keeps a timer of how long the boat has been at the same spot, and moves it when the timer gets too high
sub EVENT_WAYPOINT{
if($forceboats==1){
  if($debugpl==1){quest::shout("Checking");}
  if($butcherlastseen==$sirens){   #boat hasnt changed waypoints yet
    if( ( (($sirens>=0) && ($sirens < 14)) || ($sirens == 100))&& ($butchertimer >= 36)){        #if waypoint hasnt changed in x spawns, and boat in Butcher
      if($debugpl==1){quest::shout("Stormbreaker is in Butcherblock heading to OOT, hasn't moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to fp
      quest::setglobal("sirens",14,7,"F");}
    elsif(($sirens>=14) && ($sirens < 39) && ($butchertimer >= 36)){        #if waypoint hasnt changed in x spawns, and boat in OOT -> FP
      if($debugpl==1){quest::shout("Stormbreaker is in OOT heading to Freeport, hasnt moved, giving up and moving it to Freeport");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to oot
      quest::setglobal("sirens",39,7,"F");}
    elsif(($sirens>=39) && ($sirens < 60) && ($butchertimer >= 36)){        #if waypoint hasnt changed in x spawns, and boat in Freeport
      if($debugpl==1){quest::shout("Stormbreaker is in Freeport heading to OOT... hasnt moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to butcher
      quest::setglobal("sirens",60,7,"F");}
    elsif(($sirens>=60) && ($sirens < 100) && ($butchertimer >= 36)){   #if waypoint hasnt changed in x spawns, and boat in OOT -> Butcher
      if($debugpl==1){quest::shout("Stormbreaker is in OOT heading to Butcher... hasnt moved, giving up and moving it to Butcher");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to OOT
      quest::setglobal("sirens",100,7,"F");}
    else{                           #increase the timer
      my $tempvar = $butchertimer+1;
      if($debugpl==1){quest::shout("Stormbreaker hasn't moved, increasing timer to $tempvar");}
      quest::delglobal("butchertimer");
      quest::setglobal("butchertimer",$tempvar,3,"F");}
  }else{                          #boat has changed waypoints, tell butcherlastseen its new waypoint, reset timer to 0
    if($debugpl==1){quest::shout("Stormbreaker seems to be moving ok");}
    quest::delglobal("butcherlastseen");
    quest::setglobal("butcherlastseen",$sirens,3,F);
    $butcherlastseen = undef;
    quest::delglobal("butchertimer");
    quest::setglobal("butchertimer",0,3,7);
    $butchertimer = undef;}}



#### Watcher script:  When Sirens == 100, it spawns real boat, and changes $sirens to 0, so it won't keep triggering this script

  if($debugpl){ quest::shout("Sirens is set at $sirens");}
  if($sirens==100){
    quest::depopall(68228);
    quest::delglobal("sirens");
    quest::setglobal("sirens",0,7,"F");
    $sirens = undef;
    quest::spawn2(68228,224,0,3680,2010,-21,153);
  }
}

sub EVENT_SIGNAL{      ### depops the boat and drops players onto the real boat when the real boat signals it to
  if($debugpl){quest::shout("Fake boat depopping!");}
  quest::depop();
}

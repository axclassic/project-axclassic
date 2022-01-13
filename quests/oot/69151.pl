## INVISIBLE ONE!!
## SirensBane travels from oot to oot to oot and back
## Angelox
## Qadar
sub EVENT_WAYPOINT{
no warnings 'all' ;
 if ($event4==1){ #Pitch Black Event
  if(((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500)))&&($sirens==24)){ quest::unique_spawn(69309,71,0,7558.7,-2090.5,1.0,61.4);} #Kidd Spawn
  if(((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500)))&&($sirens==37)){quest::depopall(69309);} #Kidd Spawn
 }
#if($forceboats==1){
  #if($debugpl)==1){quest::shout("Checking");}

  if($ootlastseen==$sirens){   #boat hasnt changed waypoints yet
    if( ( (($sirens>=0) && ($sirens < 14)) || ($sirens == 100))&& ($oottimer >= 32)){        #if waypoint hasnt changed in x spawns, and boat in Butcher
      #if($debugpl)==1){quest::shout("Stormbreaker is in Butcherblock heading to OOT, hasn't moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to fp
      quest::setglobal("sirens",14,7,"F");}
    elsif(($sirens>=14) && ($sirens < 39) && ($oottimer >= 32)){        #if waypoint hasnt changed in x spawns, and boat in OOT -> FP
      #if($debugpl)==1){quest::shout("Stormbreaker is in OOT heading to Freeport, hasnt moved, giving up and moving it to Freeport");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to oot
      quest::setglobal("sirens",39,7,"F");}
    elsif(($sirens>=39) && ($sirens < 60) && ($oottimer >= 32)){        #if waypoint hasnt changed in x spawns, and boat in Freeport
      #if($debugpl)==1){quest::shout("Stormbreaker is in Freeport heading to OOT... hasnt moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to butcher
      quest::setglobal("sirens",60,7,"F");}
    elsif(($sirens>=60) && ($sirens < 100) && ($oottimer >= 32)){   #if waypoint hasnt changed in x spawns, and boat in OOT -> Butcher
      #if($debugpl)==1){quest::shout("Stormbreaker is in OOT heading to Butcher... hasnt moved, giving up and moving it to Butcher");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to OOT
      quest::setglobal("sirens",100,7,"F");}
    else{                           #increase the timer
      my $tempvar = $oottimer+1;
      #if($debugpl)==1){quest::shout("Stormbreaker hasn't moved, increasing timer to $tempvar");}
      quest::delglobal("oottimer");
      quest::setglobal("oottimer",$tempvar,3,"F");}
  }else{                          #boat has changed waypoints, tell ootseen its new waypoint, reset timer to 0
    #if($debugpl)==1){quest::shout("Stormbreaker seems to be moving ok");}
    quest::delglobal("ootlastseen");
    quest::setglobal("ootlastseen",$sirens,3,F);
    $ootlastseen = undef;
    quest::delglobal("oottimer");
    quest::setglobal("oottimer",0,3,7);
    $oottimer = undef;}
#}

#if($debugpl)){quest::shout("Sirens is set at $sirens");}
if($sirens==14){
  quest::depopall(69134);
  quest::depopall(69153);
  quest::depopall(69155);
  quest::depopall(69156);
  quest::depopall(69309); #Cap'n Kidd
  quest::delglobal("sirens");
  quest::setglobal("sirens",14.5,7,"F");
  $sirens = undef;
	if((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500))){           #nighttime
	     if ($event4==1){#Pitch Black Event
  		quest::spawn2(69156,62,0,10784.3,1151.7,-13,183.9);}
	     else{quest::spawn2(69134,62,0,10784.3,1151.7,-23,183.9);}} #daytime boat
	else{						     #daytime
  		quest::spawn2(69134,62,0,10784.3,1151.7,-23,183.9);}
 }
}


sub EVENT_SIGNAL{
  #if($debugpl)){quest::shout("Fake boat depopping!");}
  quest::depop();
}

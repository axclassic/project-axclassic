## INVISIBLE ONE!!
## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar
sub EVENT_WAYPOINT{
no warnings 'all' ;

#if($forceboats==1){

  #if($debugpl)==1){quest::shout("Checking");}

  if($freportelastseen==$sirens){   #boat hasnt changed waypoints yet
    if( ( (($sirens>=0) && ($sirens < 14)) || ($sirens == 100))&& ($freportetimer >= 34)){        #if waypoint hasnt changed in x spawns, and boat in Butcher
      #if($debugpl)==1){quest::shout("Stormbreaker is in Butcherblock heading to OOT, hasn't moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to fp
      quest::setglobal("sirens",14,7,"F");}
    elsif(($sirens>=14) && ($sirens < 39) && ($freportetimer >= 34)){        #if waypoint hasnt changed in x spawns, and boat in OOT -> FP
      #if($debugpl)==1){quest::shout("Stormbreaker is in OOT heading to Freeport, hasnt moved, giving up and moving it to Freeport");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to oot
      quest::setglobal("sirens",39,7,"F");}
    elsif(($sirens>=39) && ($sirens < 60) && ($freportetimer >= 34)){        #if waypoint hasnt changed in x spawns, and boat in Freeport
      #if($debugpl)==1){quest::shout("Stormbreaker is in Freeport heading to OOT... hasnt moved, giving up and moving it to OOT");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to butcher
      quest::setglobal("sirens",60,7,"F");}
    elsif(($sirens>=60) && ($sirens < 100) && ($freportetimer >= 34)){   #if waypoint hasnt changed in x spawns, and boat in OOT -> Butcher
      #if($debugpl)==1){quest::shout("Stormbreaker is in OOT heading to Butcher... hasnt moved, giving up and moving it to Butcher");}
      quest::delglobal("sirens");  #boat obviously isnt moving... move it to OOT
      quest::setglobal("sirens",100,7,"F");}
    else{                           #increase the timer
      my $tempvar = $freportetimer+1;
      #if($debugpl)==1){quest::shout("Stormbreaker hasn't moved, increasing timer to $tempvar");}
      quest::delglobal("freportetimer");
      quest::setglobal("freportetimer",$tempvar,3,"F");}
  }else{                          #boat has changed waypoints, tell freportelastseen its new waypoint, reset timer to 0
    #if($debugpl)==1){quest::shout("Stormbreaker seems to be moving ok");}
    quest::delglobal("freportelastseen");
    quest::setglobal("freportelastseen",$sirens,3,F);
    $freportelastseen = undef;
    quest::delglobal("freportetimer");
    quest::setglobal("freportetimer",0,3,7);
    $freportetimer = undef;}
#}



  #if($debuglpl==1){quest::shout("Sirens is set at $sirens");}
  if($sirens==39){
    quest::depopall(10196);
    quest::delglobal("sirens");
    quest::setglobal("sirens",40,7,"F");
    $sirens = undef;
    quest::spawn2(10196,24,0,-1654.87,-655.925,-80,46.5);
  }
}

sub EVENT_SIGNAL{
  #if($debugpl)==1){quest::shout("Fake boat depopping!");}
  quest::depop();
}

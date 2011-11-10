## INVISIBLE ONE!!
## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar
sub EVENT_WAYPOINT{
 if ($event4==1){ #Pitch Black Event
  if(((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500)))&&($sirens==71)){ quest::unique_spawn(69309,70,0,-9198.0,291.8,1.0,254.9);} #Kidd Spawn
  if(((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500)))&&($sirens==98)){quest::depopall(69309);} #Kidd Spawn
 }
  if($debugpl){quest::shout("Sirens is set at $sirens");}
  if($sirens==60){
    quest::depopall(69153);
    quest::depopall(69134);
    quest::depopall(69155);
    quest::depopall(69156);
    quest::depopall(69309); #Cap'n Kidd
    quest::delglobal("sirens");
    quest::setglobal("sirens",60.5,7,"F");
    $sirens = undef;
	if ((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500))){           #nighttime
	    if ($event4==1){ #Pitch Black Event
  		quest::spawn2(69155,63,0,-10583.5,-3169.6,-13,0.0);}
	    else{quest::spawn2(69153,63,0,-10583.5,-3169.6,-23,0.0);}} #daytime boat
	else{						     #daytime
  		quest::spawn2(69153,63,0,-10583.5,-3169.6,-23,0.0);}
#    quest::spawn2(69153,63,0,-10583.5,-3169.6,-23,0.0);
 }
}

sub EVENT_SIGNAL{
  if($debugpl){quest::shout("Fake boat depopping!");}
  quest::depop();
}

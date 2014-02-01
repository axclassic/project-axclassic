## DAY/NIGHT MOBS
## PITCH BLACK Event in OOT
## Angelox

sub EVENT_SPAWN {
no warnings 'all' ; 
 if ($event4==1){#Pitch Black Event
  if ((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500))){  #nighttime
   quest::spawn_condition("oot",7,0); #Day Mobs
   quest::spawn_condition("oot",8,1); #Night Mobs
  }else{						     #daytime
   quest::spawn_condition("oot",7,1); #Day Mobs
   quest::spawn_condition("oot",8,0); #Night Mobs
  }
 }
 elsif ($event4!=1){				#daytime only
   quest::spawn_condition("oot",7,1); #Day Mobs
   quest::spawn_condition("oot",8,0); #Night Mobs
  }
}
sub EVENT_WAYPOINT{
no warnings 'all' ;
 if ($event4==1){ #Pitch Black Event
  if ((($zonetime >= 1800)&&($zonetime <= 2359))|(($zonetime >= 0)&&($zonetime <= 500))){  #nighttime
   quest::spawn_condition("oot",7,0); #Day Mobs
   quest::spawn_condition("oot",8,1); #Night Mobs
  }else{						     #daytime
   quest::spawn_condition("oot",7,1); #Day Mobs
   quest::spawn_condition("oot",8,0); #Night Mobs
  }
 }
}
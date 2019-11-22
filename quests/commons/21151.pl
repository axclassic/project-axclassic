#commons night and day, spawns night or day NPCs.
#Angelox, Qadar
sub EVENT_SPAWN {
   if(($zonetime >= 0)&&($zonetime <= 800)) {        #nighttime
      quest::spawn_condition("commons", 1,1);        #live are 1
      quest::spawn_condition("commons", 2,0);        #undead are 2
   }
   elsif(($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
      quest::spawn_condition("commons", 1,1);        #live are 1
      quest::spawn_condition("commons", 2,0);        #undead are 2
   }
   else {                                            #daytime
      quest::spawn_condition("commons",1,1);
      quest::spawn_condition("commons",2,0);
   }
}

sub EVENT_WAYPOINT {
   if(($zonetime >= 0)&&($zonetime <= 800)) {        #nighttime
      quest::spawn_condition("commons", 1,1);        #live are 1
      quest::spawn_condition("commons", 2,0);        #undead are 2
   }
   elsif(($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
      quest::spawn_condition("commons", 1,1);        #live are 1
      quest::spawn_condition("commons", 2,0);        #undead are 2
   }
   else {                                            #daytime
      quest::spawn_condition("commons",1,1);
      quest::spawn_condition("commons",2,0);
   }
}
## End of spawn script

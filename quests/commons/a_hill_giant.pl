#commons night and day, spawns night or day NPCs.
sub EVENT_WAYPOINT {
   if(($zonetime >= 0)&&($zonetime <= 800)) {        #nighttime
      quest::spawn_condition("commons", 1,0);        #Undead has Condition 1, so 0 spawns them
      #quest::spawn_condition("commons", 2,1);        #Live have Condition 2 (nothing spawns condition 2)
   }
   elsif(($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
      quest::spawn_condition("commons", 1,0);        #Undead has Condition 1, so 0 spawns them
      #quest::spawn_condition("commons", 2,1);        #Live have Condition 2
   }
   else {                                            #daytime
      quest::spawn_condition("commons",1,1);
      #quest::spawn_condition("commons",2,0);
   }
}
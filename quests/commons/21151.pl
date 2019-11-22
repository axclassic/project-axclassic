#commons night and day, spawns night or day NPCs.
#This set of NPCs already has condition 2 assigned to Live
#and condition 1 assigned to Undead, so has to be like this
#Angelox, Qadar
sub EVENT_SPAWN {
   if(($zonetime >= 0)&&($zonetime <= 800)) {        #nighttime
      quest::spawn_condition("commons", 1,0);        #Undead has Condition 1, so 0 spawns them
      quest::spawn_condition("commons", 2,1);        #Live have Condition 2
   }
   elsif(($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
      quest::spawn_condition("commons", 1,0);        #Undead has Condition 1, so 0 spawns them
      quest::spawn_condition("commons", 2,1);        #Live have Condition 2
   }
#   else {                                            #daytime
#      quest::spawn_condition("commons",1,1);
#      quest::spawn_condition("commons",2,0);
#   }
}

sub EVENT_WAYPOINT {
   if(($zonetime >= 0)&&($zonetime <= 800)) {        #nighttime
      quest::spawn_condition("commons", 1,0);        #Undead has Condition 1, so 0 spawns them
      quest::spawn_condition("commons", 2,1);        #Live have Condition 2
   }
   elsif(($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
      quest::spawn_condition("commons", 1,0);        #Undead has Condition 1, so 0 spawns them
      quest::spawn_condition("commons", 2,1);        #Live have Condition 2
   }
#   else {                                            #daytime
#      quest::spawn_condition("commons",1,1);
#      quest::spawn_condition("commons",2,0);
#   }
}
## End of spawn script

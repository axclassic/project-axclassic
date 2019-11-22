# # kithicor night and day spawns
# #Angelox, Qadar
sub EVENT_SPAWN {
   if(($zonetime >= 0)&&($zonetime <= 800)) {        #nighttime
      quest::spawn_condition("kithicor", 1,0);       #live are 1
      quest::spawn_condition("kithicor", 2,1);       #undead are 2
   }
   elsif(($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
      quest::spawn_condition("kithicor", 1,0);       #live are 1
      quest::spawn_condition("kithicor", 2,1);       #undead are 2
   }
   else {                                            #daytime
      quest::spawn_condition("kithicor",1,1);
      quest::spawn_condition("kithicor",2,0);
   }
}

sub EVENT_WAYPOINT {
   if(($zonetime >= 0)&&($zonetime <= 800)) {        #nighttime
      quest::spawn_condition("kithicor", 1,0);       #live are 1
      quest::spawn_condition("kithicor", 2,1);       #undead are 2
   }
   elsif(($zonetime >= 2000)&&($zonetime <= 2359)) { #nighttime
      quest::spawn_condition("kithicor", 1,0);       #live are 1
      quest::spawn_condition("kithicor", 2,1);       #undead are 2
   }
   else {                                            #daytime
      quest::spawn_condition("kithicor",1,1);
      quest::spawn_condition("kithicor",2,0);
   }
}
## End of spawn script

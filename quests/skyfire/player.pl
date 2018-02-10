sub EVENT_CLICKDOOR {
   if(($doorid == 1) && !defined $qglobals{dragon_not_ready}) {
      quest::setglobal("door_two",1,3,"S160");
      $client->Message(4,"The globe begins to spin faster and faster...");
      if(defined $qglobals{door_one} && defined $qglobals{door_two} && defined $qglobals{door_three} && defined $qglobals{door_four}) {
         $client->Message(4,"As the energy pours into the globes, a flash of light occurs. There is now a beam of light pointing to the center of this mountain range. You should investigate.");
      }
   }
   if(($doorid == 2) && !defined $qglobals{dragon_not_ready}) {
      quest::setglobal("door_three",1,3,"S160");
      $client->Message(4,"The globe begins to spin faster and faster...");
      if(defined $qglobals{door_one} && defined $qglobals{door_two} && defined $qglobals{door_three} && defined $qglobals{door_four}) {
         $client->Message(4,"As the energy pours into the globes, a flash of light occurs. There is now a beam of light pointing to the center of this mountain range. You should investigate.");
      }
   }
   if(($doorid == 3) && !defined $qglobals{dragon_not_ready}) {
      quest::setglobal("door_four",1,3,"S160");
      $client->Message(4,"The globe begins to spin faster and faster...");
      if(defined $qglobals{door_one} && defined $qglobals{door_two} && defined $qglobals{door_three} && defined $qglobals{door_four}) {
         $client->Message(4,"As the energy pours into the globes, a flash of light occurs. There is now a beam of light pointing to the center of this mountain range. You should investigate.");
      }
   }
   if(($doorid == 232) && !defined $qglobals{dragon_not_ready}) {
      quest::setglobal("door_one",1,3,"S160");
      $client->Message(4,"The globe begins to spin faster and faster...");
      if(defined $qglobals{door_one} && defined $qglobals{door_two} && defined $qglobals{door_three} && defined $qglobals{door_four}) {
         $client->Message(4,"As the energy pours into the globes, a flash of light occurs. There is now a beam of light pointing to the center of this mountain range. You should investigate.");
      }
   }
   if(($doorid == 1) && defined $qglobals{dragon_not_ready}) {
      $client->Message(4,"The globe does not seem to do anything");
   }
   if(($doorid == 2) && defined $qglobals{dragon_not_ready}) {
      $client->Message(4,"The globe does not seem to do anything");
   }
   if(($doorid == 3) && defined $qglobals{dragon_not_ready}) {
      $client->Message(4,"The globe does not seem to do anything");
   }
   if(($doorid == 232) && defined $qglobals{dragon_not_ready}) {
      $client->Message(4,"The globe does not seem to do anything");
   }
}
# Skyfire player.pl


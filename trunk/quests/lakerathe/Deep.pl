sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 1686 => 1)) {
      # Monk Epic 1.0
      quest::summonitem(1686);
      quest::emote("Deep slowly opens her eyes and looks up at you. She stares at you a long while and then closes her eyes and lowers her head again, saying, 'Very well, if you wish death so greatly, we will be happy to oblige. My master projects part of himself in the wilder lands known as the Overthere. He has granted you an audience. Find him and show him the head of our earth brother. At that point, we will discuss how we will end your life.");
      quest::depop();
   }
}
# End of File 

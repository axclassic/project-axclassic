sub EVENT_SAY { 
my $new = quest::saylink("new", 1);
my $experienced = quest::saylink("experienced", 1);
my $another = quest::saylink("another", 1);
my $third = quest::saylink("third", 1);
my $forth = quest::saylink("forth", 1);
if($text=~/Hail/i){
quest::say("Greetings, young one. I am Manik Compolten, High Watchman. Are you a $new warrior or an $experienced fighter?");
}
if($text=~/new/i){
quest::say("It is always good to see new blood amongst the Gemchoppers. I have a small task for you. Take this keycard. I will give you only one at a time. Use each to obtain blackboxes for the C series clockworks. I am sure you are familiar with the clockworks. When you are done, bring them all to me. Let me know if you need $another keycard.");
quest::summonitem("13844");
quest::say("Find Clockworks XIIC, hand him this card to recieve the first blackbox.");
}
if($text=~/another/i){
quest::say("'Here. Remember, I will give you only one keycard at a time. These keycards only work for the C series clockworks. Let me know if you need the $third keycard.");
quest::summonitem("13844");
quest::say("Find Clockworks XVIIC, hand him this card to recieve the second blackbox.");
}
if($text=~/third/i){
quest::say("'Here. Remember, I will give you only one keycard at a time. These keycards only work for the C series clockworks. Let me know if you need the $forth keycard.");
quest::summonitem("13844");
quest::say("Find Clockworks XXVIC, hand him this card to recieve the third blackbox.");
}
if($text=~/forth/i){
quest::say("'Here. Remember, I will give you only one keycard at a time. These keycards only work for the C series clockworks.");
quest::summonitem("13844");
quest::say("Find Clockworks XXVIIC, hand him this card to recieve the forth blackbox.");
}
if($text=~/experienced/i){
quest::say("Good.  I require your talents to destroy rogue clockworks.  After we sent the clockworks to destroy the Asylum of the Mad we found some of the clockworks went haywire and never returned.  We must destroy them, not for the safety of the people, but to keep our technology from falling into the hands of any other nation. Go to the Steamfont Mountains and return their rusted blackboxes to me."); }
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 13208 => 1)) {
    quest::say("Only two blackboxes shall prove your worth to this hall.");
	quest::summonitem(13208);
	}
  if(plugin::check_handin(\%itemcount, 13208 => 2)) {
    quest::say("Excellent work! You were born to be a warrior. Here is a little bonus for the good job.");
     quest::ding(); quest::exp(100);
    quest::givecash(0,6,1,0);
    quest::faction(115,3); #gem choppers
    quest::faction(176,3); #King ak'anon
    quest::faction(210,10); #Merchants of Ak'Anon
    quest::faction(39,-10); #Clan Grikbar
    quest::faction(71,-10); #Dark Reflection
  }
  if (plugin::check_handin(\%itemcount, 13212 =>1, 13211 =>1, 13213 =>, 13214 =>1 )) {
  quest::say("Ah!! I see you had no problem finding all of the C series clockworks. Good work. Here. Take this blackbox. We received it from Clockwork 27C. Take it to Jogl Doobraugh. He is the operator of the only blackbox definer in Ak'Anon. He is out at the windmills checking on their operation.");
  quest::summonitem(13209);
  quest::faction(115,1); #gem choppers
    quest::faction(176,1); #King ak'anon
    quest::faction(210,1); #Merchants of Ak'Anon
    quest::faction(39,-1); #Clan Grikbar
    quest::faction(71,-1); #Dark Reflection
     quest::ding(); quest::exp(500);
    
  }
  if (plugin::check_handin(\%itemcount, 13215 => 1)) { 
    quest::say("This is fabulous news!! You have done well, young one. Once you are ready for [further instruction] please let me know, I will guide you through your early most dangerous days. When you have become more experienced in our art, I wil be able to further instruct you on how to progress through your early ranks, as well as in some various [trades] you will have available to you.");
    quest::summonitem(quest::chooserandom(13219, 13219, 13220, 13220, 1013, 1018, 1015, 1019, 1022, 1023, 1024, 1017, 1016, 1020, 1014, 1021));
    quest::faction(115,1); #gem choppers
    quest::faction(176,1); #King ak'anon
    quest::faction(210,1); #Merchants of Ak'Anon
    quest::faction(39,-1); #Clan Grikbar
    quest::faction(71,-1); #Dark Reflection
     quest::ding(); quest::exp(500);
    
    quest::givecash(1,3,0,0);
  }
  else {
  #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
	quest::say("I have no need of this, take it back.");
  }
}
#END of FILE Zone:akanon  ID:55155 -- Manik_Compolten 

sub EVENT_SAY {
  if ($text=~/Hail/i) {
   quest::say("Why are you talking to me? Don't you know where you are? I can either release my dark powers upon you or just call the guards and let them take into the next life! Unless you have something for me I suggest you run for your life!");  
  }
  }
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18852 => 1) && $class eq "Wizard") { 
   quest::say("So you think you are a Bloodsaber eh? Well he is your robe, Mind you many outside our order won't understand you and will think the world would be better off without you in it. Be careful where you go and who you talk to young recruit.");
   quest::summonitem(13562);
   quest::ding();
   quest::faction(282,10); 
   quest::faction(193,10); 
   quest::faction(282,10); 
   quest::faction(193,-10); 
   quest::faction(193,-10); 
   quest::exp(1000);
   }
 else {
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Wizard');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }  
}
# EOF Zone: qcat ID: 45081 NPC: Trenon Callust
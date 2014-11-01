sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest(Scripted By: Fatty Beerbelly)
    quest::say("Greetings, citizen. Welcome to Akanon. *whirr whirr* Mission *Terminate Vermin* initiated. Bring one clockwork rat leg sections from defective cleaners for reward. All defective models must be eradicated *bzzzt whirr*.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Clockwork Rat Leg Section 
  if(plugin::check_handin(\%itemcount, 10967 => 1)){ #End of Exterminate the Vermin(Scripted By: Fatty Beerbelly)
    quest::say("One Clockwork Rat Leg Sections recieved *bzzzt* processing reward. Reward mode initiated. Coins given. Mission *Terminate Vermin* reset one second *bzzt whirr*. Thank Reek the great gnome if you see him.");
    quest::faction(176,10); # +King Ak'Anon
    quest::faction(91,10); # +Eldritch Collective
    quest::faction(115,10); # +Gem Choppers
    quest::faction(71,-10); # -Dark Reflection
    quest::faction(209,-10); # -Meldrath
     quest::ding(); quest::exp(1000);
    quest::givecash(3,1,1,0);
  }
   else{
    $client->Message(14,"Sorry, I can't use this.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
        quest::givecash($copper, $silver, $gold, $platinum);
     }
} 


#ItemID: 10967 - ItemName: Clockwork Rat Leg Section
#NpcID: 00000 - NpcName: Exterminator VII - Zone: akanon
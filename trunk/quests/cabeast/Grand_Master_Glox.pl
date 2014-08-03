sub EVENT_SPAWN {
 $npc -> SetAppearance(1);
}

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote('shows no reaction to your greeting.');
  }
 elsif($text=~/agility/i){
  quest::say('I knew you were not the whiff others claimed you to be, are you sure you are $ready to be tested in agility?');
  }
 elsif($text=~/ready/i){
  quest::say('We shall spar then, I hope you are as prepared as you think you are.');
  quest::movepc(106,-190.9,1089.8,-25.2);
  }
 }

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18204 => 1)){
  quest::emote('breaks his meditation and quickly grabs your forearms. You feel the raw power in his heavily callused hands. Out of nowhere, his tail sweeps forward and places a shackle upon your wrist. He then points south towards Master Bain and returns to his meditation.');
  quest::summonitem(4190);
  quest::ding();
  quest::exp(1000);
  quest::faction(193,1);
  quest::faction(317,1);
  quest::rebind(106,-40,420,7);
 }
 else{
  quest::say("I have no need of this.. Take it back!");
  plugin::return_items(\%itemcount);
 }
}

 #Submitted by: Senzo aka Fatty Beerbelly
 #Item_IDs : taken from : http://eqitems.13th-floor.org/
 #END of FILE : Zone : cabeast : NPC_ID : 2023 : Grand_Master_Glox

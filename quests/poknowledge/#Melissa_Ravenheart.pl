#######################################
## NPC: Melissa Ravenheart           ##
## Zone: Plane of Knowledge          ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     29-07-2014     ##
#######################################
sub EVENT_SAY {
my $prestige = quest::saylink("prestige", 1); 
my $sent = quest::saylink("sent", 1); 

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello $name , I am Melissa Ravenheart the famous Magician. Please tell me that you heard of me in the past. I can $sent you on your $prestige quest if you like..");
  }
  elsif  ($text=~/hail/i && $ulevel < 65) {
  $client->Message(14,"You are not old enough for this quest yet, you simply cannot survive. Come back when you are lvl 65++");
  return 1;
   }

  if ($text=~/prestige/i && $ulevel >= 65) {
    $client->Message(14,"The Rathe Prestige quest is a very very hard quest (mega epic style) for what could very well be THE most powerfull item in the game. I won t tell you wat the reward is but I can tell you that you absolutely want to do this quest $name .");
  }
      if ($text=~/sent/i && $ulevel >= 65) {
        $client->Message(14,"For more details regarding this quest you will have to bring me 1 Rathe Prestige Token. It can be purchased nearby. Giving me this token shows me that you are motivated and dedicated enough to start on your journey.");
  }
}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119932 => 1) && $ulevel == 65) {
    $client->Message(14,"Very well $class , prepare yourself for the biggest adventures of all. You are going to do the Rathe Prestige Quest. I cannot say that I envy you. It will be a LONG and very HARD journey... Give this coin to Mehir. He can be found in the ice regions of Velious."); #prestige token handin
    quest::summonitem(119933);   
    return 1;
 }

else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}
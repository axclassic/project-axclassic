sub EVENT_SAY { 
my $Seloxia = quest::saylink("Seloxia", 1);
if($text=~/Hail/i){
quest::say("Welcome. A brother of the Indigo you must be. Why else would one dare to roam the corridors of the Cauldron of Hate? You were most likely sent to speak with Yegek. If so. speak up and tell Yegek did $Seloxia send you?"); }
}
if($text=~/Seloxia/i){
quest::say("Glad to have the help $name, Here take this bag and fill it with 3 bone chips and 3 fire beetle eyes, combine it, and return the bag to me.");
quest::say("if you can finish this task,I have $second test you can try.");
quest::summonitem(119866);
quest::say("What ever you do, DO NOT loose your beginners sword. You will have need of it for the next task.");
}
if($text=~/second/i){
quest::say("So you think you are ready eh? This will be a test of your metal.");
quest::say("In the Arena there is a monster, he is of little use to anyone but it will be a good sparring partner for you.");
quest::say("It must be killed by you but, you can not use a blade. You can use any other type of weapon.");
quest::say("Hand me your traing sword, I will return it to you if you bring me the head of the Teir'Dal Coward."); 
}
sub EVENT_ITEM {
my $second = quest::saylink("second", 1);
 if (plugin::check_handin(\%itemcount, 119866 => 1) && $class eq "Warrior") { 
  quest::say("Well done for a beginner $name. Return to me when you are ready for your $second test.");
  quest::summonitem(quest::ChooseRandom(16546, 13005));
  quest::ding();
 quest::faction(155, 10);  #Indigo Brotherhood
 quest::faction(311, -30);  #Steel Warriors
 quest::faction(92, -30);  #Emerald Warriors
 quest::exp(1000);
  }
 elsif (plugin::check_handin(\%itemcount, 9998 => 1) && $class eq "Warrior") { 
  quest::say("Let the game begin.");
  quest::spawn2(41098,0,0,-1221.2,-10.7,-26.8,124);
	}
 elsif (plugin::check_handin(\%itemcount, 13888 => 1) && $class eq "Warrior") {	
 quest::say("exelent work there $name. You are on your way to being a feared warrior!");
 quest::say("Here is your shortsword back. Now, begone with you, I have other recruits to train.");
 quest::summonitem(9998);
 quest::ding();
 quest::faction(155, 10);  #Indigo Brotherhood
 quest::faction(311, -30);  #Steel Warriors
 quest::faction(92, -30);  #Emerald Warriors
 quest::exp(1000);
} 
else {
#do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:neriakb  ID:41031 -- Yegek_B`Larin 

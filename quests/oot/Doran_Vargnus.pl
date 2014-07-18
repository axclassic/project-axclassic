sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Welcome to my shop $name. Is there something in particular I can help you with?");
}
}
sub EVET_ITEM {
  if (plugin::check_handin(\%itemcount, 22299 =>1)) {
  quest::say("So Beno sent you to me eh? I collect these cards, they have no real value but at least I can play cards when I don't have a customer.");
  quest::say("Since you went to all the trouble to bring me this card the least I can do is give you an item that may make the trip worth your while. Take this and I hope it serves you well.");
  quest::summonitem(quest::ChooseRandom(3040,3042,3043,3044,3046,3047,3048,3049,3050,3051));
  quest::ding();
  quest::faction(169, 10);    #kazon stormhammer
  quest::faction(215, 10); 	#merchants of kaladim
  quest::faction(219, 10); 	#miners guild 249
  quest::faction(314, 10);	#storm guard
  quest::faction(57, -10);    #Craknek Warriors
  quest::exp(1000);
  }
  }
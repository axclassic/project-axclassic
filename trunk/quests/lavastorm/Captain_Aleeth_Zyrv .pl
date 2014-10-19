sub EVENT_SAY {
my $tests = quest::saylink("tests", 1);
  if ($text=~/Hail/i){
   quest::say("So you wish to help The Dark Reign eh? Well then I have a few $tests for you to see if you are worthy.");
   }
  if ($ulevel <= 30 && $ulevel >= 21 && $text=~/tests/i){
   quest::say("Deep in the caverns of the Lavaspinner's Lair is the queen of the spiders. Her name is Volkara and hour by hour she builds her army of lavaspinners that weave and kill by spinning webs as hot and deadly as the lava that surrounds them. She has taken to the flavor of the blood and flesh of mortals and she must be stopped. You must go there in the name of Norrath's Keepers and Firiona Vie to stop the flow of blood in her caves.");
   quest::say("Bring to me her blood as proof of her demise and you shall be rewarded");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/tests/i){
   quest::say("You must hurry. The Norrath Keepers are slowly making their way deeper into Tirranun's Delve. We have heard they seek a magic that the delve goblins possess that allows them to create a great, sentient, and dangerous dervish of stone. This dervish is a danger to anyone in the delve, but if the Norrath Keepers are able to capture and harness the dervish, they will most certainly use it in the army they build. You must find a way to claim this magic for the Dark Reign!");
   quest::say("Bring to me the Essence of Emoush as proof for your reward.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/tests/i){
   quest::say("I am sorry $name, I have nothing for an explorer of your experiance. Check with the others as they may have things you can do to help the Dark Reign. Come back to me as you gain experiance and I may have other missiopns you can help with.");
   }
  if ($ulevel <= 60 && $ulevel >= 51 && $text=~/tests/i){
   quest::say("There have been several sightings of a massive guardian that has risen in the sand gardens of Stillmoon Temple. This guardian has been very protective of the area and we have lost contact with several scouts that were sent to gather more information. The scouts that have survived the attacks report that the guardian is allied with the sand goblins of the region. It is simply too dangerous to continue our exploration of the temple as long as that guardian is around. We need you to remove it.");
   quest::say("Bring back proof of its demise and you shall be rewarded.")
   }
   }
sub EVENT_ITEM {
   if ($ulevel <= 30 && $ulevel >= 21 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(1000000);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel <= 40 && $ulevel >= 31 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(10000000);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel <= 60 && $ulevel >= 51 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,75);
   }
   }
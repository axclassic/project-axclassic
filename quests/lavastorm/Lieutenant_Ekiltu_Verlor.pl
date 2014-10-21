sub EVENT_SAY {
my $test = quest::saylink("test", 1);
my $Shadows = quest::saylink("Shadows", 1);
my $Curse = quest::saylink("Curse", 1);
my $Guardian = quest::saylink("Guardian", 1);
my $Perseverance = quest::saylink("Perseverance", 1);
   if ($text=~/Hail/i){
   quest::say("Good Day to you traveler, I recieved orders and I am looking for able bodied explorers wanting to $test thier skills.");
   }
   if ($ulevel <= 20 && $text=~/test/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/test/i){
   quest::say("Deep in the caverns of the Lavaspinner's Lair is the queen of the spiders. Her name is Volkara and hour by hour she builds her army of lavaspinners that weave and kill by spinning webs as hot and deadly as the lava that surrounds them. She has taken to the flavor of the blood and flesh of mortals and she must be stopped. You must go there in the name of Norrath's Keepers and Firiona Vie to stop the flow of blood in her caves.");
   quest::say("Bring to me her blood as proof of her demise and you shall be rewarded");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/test/i){
   quest::say("You must hurry. The Dark Reign are slowly making their way deeper into Tirranun's Delve. We have heard they seek a magic that the delve goblins possess that allows them to create a great, sentient, and dangerous dervish of stone. This dervish is a danger to anyone in the delve, but if the Dark Reign are able to capture and harness the dervish, they will most certainly use it in the army they build. You must find a way to put an end to this magic posthaste!");
   quest::say("Bring to me the fragment as proof for your reward.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/test/i){
   quest::sya("I have two expeditions from which you may choose, In The $Shadows and The $Curse of Ju'Rek.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Shadows/i){
   quest::say("Terrible events came to pass as Yar`Lir was taken from her perch. There was a dragon that protected the Nest beneath the islands in the sky, but now that place has turned to ruin and darkness. After seeing the effects the corruption has caused the Nest, we can only guess what has happened to the dragon that inhabited it. Go now and be swift. If this dragon is a plague on our lands, it must be stopped."); 
   quest::say("Bring me the head of Vishimtar as proof for your reward.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Curse/i){
   quest::say("You must travel into the Nest and learn as much as you can about the corruption of the place. There are a number of drakes in the caverns of the Nest that have been twisted somehow. We want you to look for a drake that has been rumored to be altered so significantly that it has unique magic. Go learn more about it and kill it if you can.");
   quest::say("Bring to me a wing fragment as proof.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/test/i){
   quest::say("I have two assignments for someone of your experiance $name. $Guardian of the Sands and Trial of $Perseverance.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Guardian/i){
   quest::say("There have been several sightings of a massive guardian that has risen in the sand gardens of Stillmoon Temple. This guardian has been very protective of the area and we have lost contact with several scouts that were sent to gather more information. The scouts that have survived the attacks report that the guardian is allied with the sand goblins of the region. It is simply too dangerous to continue our exploration of the temple as long as that guardian is around. We need you to remove it.");
   quest::say("Bring back proof of its demise and you shall be rewarded.")
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Perseverance/i){
   quest::say("There are still more parchments and tomes we wish to learn about in Stillmoon Temple. Some of these documents may provide the Dark Reign with the ability to bring ruin to the world. You must use your strength, stamina, and wherewithal to uncover these scrolls and secure them before Dark Reign can get their hands on them.");
  } 
  if ($ulevel >= 61 && $text=~/test/i){
   quest::say("It is peculiar that the goblins in Thundercrest Isles have issued a challenge to Norrathians. As much as we don't often bend to threats and arrogance, we are curious what the outcome of this challenge might be -- and it's better that we find out and be prepared for it, rather than the Dark Reign. Be on your guard. It could very well be a trap.");
   quest::say("Return to me with proof of your victory and you shall be rewarded.");
   }
 }
   sub EVENT_ITEM {
   if ($ulevel <= 30 && $ulevel >= 21 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel <= 40 && $ulevel >= 31 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The death of Emoush should set the Dark Reign back a bit on thier attempts to take over the world.");
   quest::ding();
   quest::exp(10000000);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 57201 => 1)) {
   quest::say("Well done $name! Your first run in with a dragon, there will be many more as you continue on your journeys.");
   quest::ding();
   quest::exp(20000000);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel <= 50 && $ulevel >= 41 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(20000000);
   quest::givecash(0,0,0,50);
   }
   elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 57204 => 1)) {
   quest::say("Quite the challenge I would say, seems it was more of a test to see if they were strong enogh to over take us.");
   quest say("Well done, $name, I am happy you are on our side!");
   quest::ding();
   quest::exp(40000000);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel <= 60 && $ulevel >= 51 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,75);
   }
           else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }  
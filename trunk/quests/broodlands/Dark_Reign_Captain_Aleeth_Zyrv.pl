sub EVENT_SAY {
my $test = quest::saylink("test", 1);
  if ($ulevel <= 20 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hail/i){
   quest::say("So you wish to help The Dark Reign eh? Well then I have a $test for you to see if you are worthy.");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/Hail/i){
   quest::say("So you wish to help The Dark Reign eh? Well then I have a few $tests for you to see if you are worthy.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("I am sorry $name, I have nothing for an explorer of your experiance. Check with the others as they may have things you can do to help the Dark Reign. Come back to me as you gain experiance and I may have other missiopns you can help with.");
   }
   if ($ulevel >= 61 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Norrath Keepers with.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/test/i){
   quest::say("Deep in the caverns of the Lavaspinner's Lair is the queen of the spiders. Her name is Volkara and hour by hour she builds her army of lavaspinners that weave and kill by spinning webs as hot and deadly as the lava that surrounds them. She has taken to the flavor of the blood and flesh of mortals and she must be stopped. You must go there in the name of Norrath's Keepers and Firiona Vie to stop the flow of blood in her caves.");
   quest::say("Bring to me her blood as proof of her demise and you shall be rewarded");
   }
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/test/i){
   quest::say("You must hurry. The Norrath Keepers are slowly making their way deeper into Tirranun's Delve. We have heard they seek a magic that the delve goblins possess that allows them to create a great, sentient, and dangerous dervish of stone. This dervish is a danger to anyone in the delve, but if the Norrath Keepers are able to capture and harness the dervish, they will most certainly use it in the army they build. You must find a way to claim this magic for the Dark Reign!");
   quest::say("Bring to me the Essence of Emoush as proof for your reward.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/test/i){
   quest::say("There have been several sightings of a massive guardian that has risen in the sand gardens of Stillmoon Temple. This guardian has been very protective of the area and we have lost contact with several scouts that were sent to gather more information. The scouts that have survived the attacks report that the guardian is allied with the sand goblins of the region. It is simply too dangerous to continue our exploration of the temple as long as that guardian is around. We need you to remove it.");
   quest::say("Bring back proof of its demise and you shall be rewarded.")
   }
 }
sub EVENT_ITEM {
if ($ulevel == 21 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(126100);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 22 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(138700);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 23 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(151900);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 24 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(165700);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 25 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(180100);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 26 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(195100);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 27 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(210700);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 28 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(226900);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 29 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(243700);
   quest::givecash(0,0,0,30);
   }
   if ($ulevel == 30 && plugin::check_handin(\%itemcount, 120163 => 1)) {
   quest::say("Whew! Glad you were able to take care of that little issue. Be sure to check with others as they may have more  work for a rising champion as yourself.");
   quest::ding();
   quest::exp(531100);
   quest::givecash(0,0,0,30);
   }
elsif ($ulevel == 31 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(307010);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 32 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(327470);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 33 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(348590);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 34 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(370370);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 35 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(479640);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 36 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(453720);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 37 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(479640);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 38 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(506280);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 39 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(533640);
   quest::givecash(0,0,0,40);
   }
   elsif ($ulevel == 40 && plugin::check_handin(\%itemcount, 57202 => 1)) {
   quest::say("Well done $name! The power of Emoush is now in control of the Dark Reign! The Keepers can not stop us now!.");
   quest::ding();
   quest::exp(1201720);
   quest::givecash(0,0,0,40);
   }
elsif ($ulevel == 51 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(2397650);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 52 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(2599630);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 53 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(2811810);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 54 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(4609070);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 55 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(3356840);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 56 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(3604360);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 57 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(3863100);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 58 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(4133300);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 59 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(6468990);
   quest::givecash(0,0,0,75);
   }
   elsif ($ulevel == 60 && plugin::check_handin(\%itemcount, 57207 => 1)) {
   quest::say("Well done $name! Now our scouts can get back to gathering information.");
   quest::ding();
   quest::exp(4815250);
   quest::givecash(0,0,0,75);
   }
       else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }
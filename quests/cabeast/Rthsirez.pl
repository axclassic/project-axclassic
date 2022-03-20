# Magics of Fear Quest
# NPC: Cabilis East (cabeast) >> Rthsirez (106146)

my $subject = quest::saylink("subject", 1);
my $scroll = quest::saylink("scroll", 1);
my $further = quest::saylink("further", 1);

sub EVENT_SAY {
   if($text =~ /hail/i) {
      quest::emote(" tilts his head and exhales, his breath a stuttering hiss, 'Greetings, $race. What brings you to me? Perhaps you are in search of knowledge? Aaahhh, yes. Of course. Why else would you come to one such as I? However, I am quite held up with a particular case of my own study and may not be one for conversation beyond the $subject of my current attentions.'");
   }
   if($text =~ /subject/i) {
      quest::say("I am currently studying an ancient and lost method of containing power -- to be precise, a specific method that turns the incorporeal into something of tangible use and great power to those of us who wield the magics of fear. It is... almost irritating, this research, as I find myself unable to press forward. A specific $scroll, one very necessary to this study, is lost to me and none of my apprentices have been able to retrieve it.");
   }
   if($text =~ /scroll/i) {
      quest::say("Will you now, $race? Very well. I shall not object to your assistance in this matter. The scroll I require is made of the flayed flesh of the sarnak. It is understandable that they treasure this relic, for it is the flesh of one of their fallen royalty. Bring this scroll to me, $race, and perhaps you'll have my appreciation... and a reward.");
   }
   if($text =~ /further/i) {
      quest::say("How fortunate for you, $race, for you know not the reward that awaits if we are successful! Beside the Invocation of Fear I will need the Tome of the Corrupter that resides in the tomb of Drusella, Dull Black Ore from the Hole, and a Dented Battle Shield. If, and only if, you deliver me these four items, $race, will you receive your reward.");
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 6571 => 1)) { #Flayed Sarnak Hide Scroll
      quest::say("Aaaah, excellent, $race. You have returned the scroll in one piece. Miraculously, you are in one piece as well. How truly marvelous. With the missing piece of my linguistic research, I'm finally able to complete the translation of a piece of ancient literature. $race, take these Words of Terror to my colleague, Sarviksa Tiths. Once you complete a task that I am sure she will need of you, $race, Sarviksa shall give you the Invocation of Fear, which you shall return to me with the $further items, if you wish to receive your just reward.");
      quest::summonitem(6572); #Words of Terror
      quest::ding();
      quest::exp(20000);
      quest::faction(282,20);
      quest::faction(193,10);
   }
   elsif(plugin::check_handin(\%itemcount, 120343 => 1, 6575 => 1, 6576 => 1, 6573 => 1)) { #Invocation of Fear, Dull Black Ore, Dented Battleshield, Tome of the Corrupter
      quest::say("Excellent, excellent! Yes, this is perfect...' The old shaman closes his eyes as he clutches the dented shield. Uttering in a soft hissing growl, he speaks an ancient voice of magic -- the incantation is foreign and like no language you have ever heard. The shield glows with a dark radiance as he speaks, but dulls when he completes his odd chant. Opening his reptilian eyes, he extends the shield to you, 'Bear it in the faith and respect of the power of Dread, $race.");
      quest::summonitem(120345); #Sacred Shield of Dread
      quest::ding();
      quest::exp(20000);
      quest::faction(282,20);
      quest::faction(193,10);
   }
   else {
      plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:Cabilis East (cabeast) >> Rthsirez (106146)


sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::emote("ignores you.");
   }
   elsif($text=~/yes/i) {
      if((defined $qglobals{headz}) && ($qglobals{headz} == 1)) {
         quest::emote("says 'I assume you have read about us and spoken with the old man, Kaiaren. Since that time, I have grown in power and influence to a point unseen by any mortal. Unfortunately, I will have to demonstrate a small amount of my skill when I destroy you. This is bad. I must decide whether you are worthy to see the techniques I wield, even though you will die shortly thereafter. Tell me, who are you?");
      }
   }
   elsif($text=~/i am the one/i) {
      if((defined $qglobals{headz}) && ($qglobals{headz} == 1)) {
         quest::emote("Astral Projection chuckles and says, 'That's quite a boast. All beings strive for nothingness at the most basic level of sentience. However, almost none ever achieve this. Not even I have discarded my ego yet and you stand here and tell me you have? Perhaps you will be a worthy opponent. I shall be waiting in the great lake near here. Take that token as proof of things to come for you. If you still wish to throw your life away so needlessly, return it to my image there. I await your decision.'");
         quest::summonitem(1687);
         quest::delglobal("headz");
         quest::depop();
      }
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 1686 => 1)) {
      quest::setglobal("headz", 1, 0, "Y5");
      quest::emote("looks up and down and says, 'Hmmm, I was hoping for something more impressive. This is just a small token of the last person who tried to interfere with my plans. He failed as you shall. But tell me truly, are you the one who has so rudely removed my students?'");
   }
}

# End of File 

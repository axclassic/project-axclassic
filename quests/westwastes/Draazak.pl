sub EVENT_SAY {
 if($text=~/Hail/i){ #(Scripted By: Fatty Beerbelly)
  quest::say("Greetings, $name. It cannot be that you would present yourself before me without reason. What brings you to these lands on this day? Please be quick for I have many ancient runes I must study.");
 }
}

sub EVENT_ITEM {
 #Handin: Jualicn's Token
 if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Part of Hsagra's Wrath Quest (Scripted By: Fatty Beerbelly)
  quest::say("$name, whom Relinar found to be necessary for the success of the magic against those foul giants. I present this Rune of Concentration to you with faith that you are trusted amongst us or you would not have been sent to me. Make haste so that no time is wasted in extracting revenge for their past transgressions.");
  quest::faction(42,100); # +ClawsofVeeshan 
  quest::faction(362,100); # +Yelinak
  quest::faction(189,-1); # -Kromzek
   quest::ding(); quest::exp(1000); 
  quest::summonitem('1896');
  quest::summonitem('1908');
 } 
 else {
  quest::say('I have no need for this item, $name, you can have it back.');
  plugin::return_items(\%itemcount);
 }
}


#ItemID: 1896 - ItemName: Rune of Concentration
#ItemID: 1908 - ItemName: Jualicn's Token
#NpcID: 120019 - NpcName: Draazak - Zone: westwastes
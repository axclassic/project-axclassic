sub EVENT_SAY {
 if($text=~/Hail/i){ #(Scripted By: Fatty Beerbelly)
  quest::say("It is not often that I see strangers in these dangerous lands. Perhaps you are the chosen that Jualicn speaks of that will aid us in our battle against the foul giants. I do not believe you would be here if you were not in need of my sacred rune.");
 }
}

sub EVENT_ITEM {
 #Handin: Jualicn's Token
 if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Part of Hsagra's Wrath Quest (Scripted By: Fatty Beerbelly)
  quest::say("I have given you the Rune of Bleve, to assist you in your research for the once lost magic against the Kromzek. I hope that you can make good use of it, for it is very sacred to me. May Veeshan guide your path!");
  quest::faction(42,100); # +ClawsofVeeshan 
  quest::faction(362,100); # +Yelinak
  quest::faction(189,-1); # -Kromzek
   quest::ding(); quest::exp(1000);
  quest::summonitem('1895');
 } 
 else {
  quest::say('I have no need for this item $name, you can have it back.');
  plugin::return_items(\%itemcount);
 }
}


#ItemID: 1895 - ItemName: Rune of Bleve
#ItemID: 1908 - Jualicn's Token
#NpcID: 120014 - NpcName: Derasinal - Zone: westwastes
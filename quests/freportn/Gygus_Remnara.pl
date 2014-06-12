sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("The Temple of Marr welcomes you. I am Gygus Remnara. High Sentinel for the Sentries of Passion. We are the order of paladins within the Priests of Marr and whose charge it is to protect the holy Temple of Marr."); }
}
sub EVENT_ITEM { 
 if (plugin::check_handin(\%itemcount, 18738 => 1)){
	quest::say("Thanks.");
	quest::summonitem(13554); #Faded Purple Tunic
	quest::ding();
	quest::faction(112, 10);  #Knights of Truth
    quest::faction(147, 10);  #Priests of Marr
    quest::faction(145, 10);  #Steel Warriors
    quest::faction(143, -30); #Dismal Rage
	quest::faction(143, -30); #The Freeport Militia
	quest::exp(1000);
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8028 -- Gygus_Remnara 


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name!  Stand tall whenever you are speaking to the Sheriff of Rivervale.  I command the warriors of this vale.  You must be new to the ranks of the Guardians of the Vale. so be sure to report to your squad at once.  We must protect our people.  The [danger] has come closer to home.  If you are not a deputy. then please leave these halls.");
}
if($text=~/what danger/i){
quest::say("What danger?!!  You must be new to the community.  The goblins of Clan Runnyeye have been scaling our wall somehow.  You must join our forces in exterminating every one of those beasts.  Your wages are earned with every four bloody goblin warbead necklaces you return to me.  Now be off and fight the good fight."); }
}

sub EVENT_ITEM { 
 if($itemcount{13931} == 4){
	quest::say("Good work. Deputy $name!  We shall soon rid our countryside of the goblin threat.  Here are your wages.  Eat well tonight!");
	quest::summonitem(13024);
	quest::givecash("0","6","0","0");
	quest::faction(133, 10); #Guardians of the Vale
	quest::faction(7, 10); #Ankhesenaten
 }   
  elsif(plugin::check_handin(\%itemcount, 18733 => 1)) { #Recruitment Summons
  quest::say("Take this and wear it with pride, $name.");
    quest::summonitem(9996); #Guild Tunic*
	quest::ding();
	quest::faction(208, 10); #Mayor Gubbin
	quest::faction(133, 10); #Guardians of the Vale
	quest::faction(218, 10); #Merchants of Rivervale
	quest::faction(316, 10); #Storm Reapers
	quest::faction(88, -10); #Dreadguard outer
    quest::exp(100);
   }
 else {
 #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
 quest::say("I have no need for this, you may have it back.");
 plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:rivervale  ID:19062 -- Sheriff_Roglio 


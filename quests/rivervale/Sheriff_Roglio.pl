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
	quest::summonitem("13024","7");
	quest::givecash("0","6","0","0");
	quest::faction("111","1");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:rivervale  ID:19062 -- Sheriff_Roglio 


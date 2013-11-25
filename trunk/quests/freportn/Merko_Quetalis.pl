sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. good citizen!  You have entered the Hall of Truth.  What is it you seek?  Many citizens come to request aid in dealing with the local rogues or the oppression of our sworn enemies. the Freeport Militia.  A few valiant ones have been summoned to the Hall of Truth.");
}
if($text=~/summoned/i){
quest::say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do."); }
}
sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 14018 => 1)){
	quest::summonitem("12144");
	quest::faction("322","1");
	quest::faction("304","-1");
	quest::faction("10103","1");
 } elsif(plugin::check_handin(\%itemcount, 12144 => 1, 13865 => 1)){
	quest::faction("322","1");
	quest::faction("304","-1");
	quest::faction("10103","1");
 } elsif(plugin::check_handin(\%itemcount, 13866 => 1)) {
	quest::summonitem("18828");
	quest::givecash("0","0","6","0");
	quest::faction("322","1");
	quest::faction("304","-1");
	quest::faction("10103","1");
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8036 -- Merko_Quetalis 


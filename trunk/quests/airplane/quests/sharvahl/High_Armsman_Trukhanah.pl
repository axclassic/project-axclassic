sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. friend.  May I be of assistance?"); }
}
sub EVENT_ITEM { 
if($itemcount{18553} == 1){
quest::say("Good $name. I am pleased to see you. You have come of age and it is time for you to register as a citizen of Shar Vahl. Your invitation indicates that the Khala Dun. defenders of our society. have noticed you and consider your potential to be worthy of our training. First. take this application to Registrar Bindarah and return to me with proof of your citizenship.");
quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
quest::summonitem("2873");
} else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:sharvahl  ID:155170 -- High_Armsman_Trukhanah 


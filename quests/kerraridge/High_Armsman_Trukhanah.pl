sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. friend.  May I be of assistance?"); 
if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
  quest::say("Luckily for you someone found it.");
  quest::summonitem(2873);}
if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
  quest::say("Someone found this stuck in the top of a palm tree in the center of the plaza. I don't even want to know how it got there, just try not to lose it this time.");
  quest::summonitem(2878);}
 }
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18553 => 1)) {
quest::say("Good $name. I am pleased to see you. You have come of age and it is time for you to register as a citizen of Shar Vahl. Your invitation indicates that the Khala Dun. defenders of our society. have noticed you and consider your potential to be worthy of our training. First. take this application to Registrar Bindarah and return to me with proof of your citizenship.");
quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
quest::summonitem("2873");
quest::setglobal("Shar_Vahl_Cit",1,5,"F");
} 
elsif (plugin::check_handin(\%itemcount, 2877 => 1, 2897 => 1)) {
  quest::setglobal("Shar_Vahl_Cit",7,5,"F");
  quest::summonitem(2878);
}
else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
}
plugin::return_items(\%itemcount);
}
#END of FILE Zone:kerraridge  ID:74367 -- High_Armsman_Trukhanah 


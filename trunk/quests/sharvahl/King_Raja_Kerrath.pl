sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings citizen... you are very brave to approach me in this manner.  That sort of bravery warrants my respect.  How may I help you?"); }
##Non-canon fixme if you lose note.
if(($text=~/note/i) && ($qglobals{Shar_Vahl_Cit} == 5)){
  quest::say("I guess I can write you a new note. Try not to lose it this time.");
  quest::summonitem("18304");
}
}
sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount, 18299 => 1)){
quest::say("Your humility and willingness to serve shall not be wasted. There is much to be done. $name. and our people thank you in advance for your selfless service.");
quest::setglobal("Shar_Vahl_Cit",5,5,"F");
quest::summonitem(18304); }
plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155154 -- King_Raja_Kerrath 


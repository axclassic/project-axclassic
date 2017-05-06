##Progression 317149 Progression flag for Keldovan##
sub EVENT_SAY{
   if($text=~/Hail/i){
   quest::setglobal("FKeldovan", 1, 5, "F");
   quest::ze(14,"You recieve a character flag!");
   quest::depop();
  }
 }
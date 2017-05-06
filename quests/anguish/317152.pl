##Progression 317152 Progression flag for Havnar##
sub EVENT_SAY{
   if($text=~/Hail/i){
   quest::setglobal("FHanvar", 1, 5, "F");
   quest::ze(14,"You recieve a character flag!");
   quest::depop();
  }
 }
##Progression 317150 Progression flag for Jelvan##
sub EVENT_SAY{
   if($text=~/Hail/i){
   quest::setglobal("FJelvan", 1, 5, "F");
   quest::ze(14,"You recieve a character flag!");
   quest::depop();
  }
 }
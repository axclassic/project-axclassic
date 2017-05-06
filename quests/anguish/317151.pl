##Progression 317151 Progression flag for Ture##
sub EVENT_SAY{
   if($text=~/Hail/i){
   quest::setglobal("FTure", 1, 5, "F");
   quest::ze(14,"You recieve a character flag!");
   quest::depop();
  }
 }
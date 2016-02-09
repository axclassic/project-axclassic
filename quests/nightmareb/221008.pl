sub EVENT_SPAWN{{
   quest::settimer("nightmareb_Planar",600);
 }
sub EVENT_SAY {
   if($text=~/Hail/){
     quest::delglobal("Tthule");
     quest::setglobal("pop_ponb_terris", 1, 5, "F");
     $client->Message(4,"You receive a character flag!");
    quest::stoptimer("nightmareb_Planar");
    quest::movepc(203,-1170.8,667.2,-847.8);
    quest::depop();
   }
 }
sub EVENT_TIMER {
   if($timer eq "nightmareb_Planar"){
    quest::stoptimer("nightmareb_Planar");
    quest::movepc(203,-1170.8,667.2,-847.8);
    quest::depop();
  }
}

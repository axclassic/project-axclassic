## Watches skiffs status
# Zone: butcher
# AngeloX

sub EVENT_SAY {if ($text=~/hail/i){quest::say("Hail $name! If it's the Skiffs to Timorous you are waiting for, they will arrive at this pier, you might have to wait a while...");}}

sub EVENT_SPAWN{
 $x = $npc->GetX();
 $y = $npc->GetY();
 quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
   if (($skiffa >=0) && ($skiffa <=39)){
     quest::delglobal("skiffa");
     quest::setglobal("skiffa",0,7,"F");
     $skiffa=undef;}}

sub EVENT_WAYPOINT {
    if (($skiffb ==1) && ($skiffa >=40) && ($skiffa <=80)){
      quest::settimer("skwt1",100);      #wait for some grid movement.
      quest::delglobal("skiffb");
      quest::setglobal("skiffb",$skiffa,7,"F");#Testing for activity, set to current $skiffa.
      $skiffb=undef;}}

sub EVENT_TIMER{
   if (($timer eq "skwt1") && ($skiffa >=40) && ($skiffa <=80) && ($skiffb==$skiffa)){
     # quest::shout("No movement in Timorous, starting Butcher run!");
      quest::delglobal("skiffb");
      quest::setglobal("skiffb",0,7,"F"); #No activity, so start in Butcher (Set to 0).
      $skiffb=undef;
      quest::delglobal("skiffa");
      quest::setglobal("skiffa",0,7,"F");
      quest::stoptimer("skwt1");
      $skiffa=undef;}
   else{
     # quest::shout("Boat activity detected in Timorous, but will check again ...");
      quest::delglobal("skiffb");
      quest::setglobal("skiffb",1,7,"F"); #Skiff must be in here, but set to 1 for a recheck
      quest::stoptimer("skwt1");
      $skiffb=undef;}}

sub EVENT_ENTER{
   if (($skiffa >=40) && ($skiffa <=80)){
     quest::delglobal("skiffb");
     quest::setglobal("skiffb",1,7,"F");
     $skiffb=undef;}}

  

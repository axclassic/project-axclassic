#############
## Watches skiffs status, starts the Island Shuttle movement, and rouge roamer boats
## Zone: Timorous
## AngeloX
#############
sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    if (($skiffa >=40) && ($skiffa <=80)){
     quest::delglobal("skiffa");
     quest::setglobal("skiffa",40,7,"F");
     $skiffa=undef;}}

sub EVENT_WAYPOINT {
   if (($skiffc ==1) && ($skiffa >=0) && ($skiffa <=40)){
      quest::settimer("skwt2",100);       #wait for some grid movement.
      quest::delglobal("skiffc");
      quest::setglobal("skiffc",$skiffa,7,"F");#Testing for activity, set to current $skiffa
      $skiffc=undef;}
   if (($shuta < 40) && ($shutc ==1) && ($maidna==8)){
      quest::settimer("skwt3",150); #wait for some grid movement.
      quest::delglobal("shutb");
      quest::setglobal("shutb",$shuta,7,"F");#Testing for activity, set to current $shuta.
      $shutb=undef;
      quest::delglobal("shutc");
      quest::setglobal("shutc",3,7,"F");#Set timer variable 3 for check
      $shutc=undef;}
   if (($maidna <=39) && ($maidnc ==1)){
      # quest::shout("Timer Set!");
      quest::settimer("skwt4",410); #wait for some grid movement.
      quest::delglobal("maidnb");
      quest::setglobal("maidnb",$maidna,7,"F");#Testing for activity, set to current $maidna.
      $maidnb=undef;
      quest::delglobal("maidnc");
      quest::setglobal("maidnc",3,7,"F");#Set timer variable to 3 for check
      $maidnc=undef;}}

sub EVENT_TIMER{
   if (($timer eq "skwt3") && ($shuta <=40) && ($shuta==$shutb)){
      quest::delglobal("shuta");
      quest::setglobal("shuta",1,7,"F"); #No activity, so ready Shuttle.
      $shuta=undef;
      quest::spawn2(96075,20,0,-2380,-3963,-4,103.6);
      quest::delglobal("shutc");
      quest::setglobal("shutc",0,7,"F");#Set timer variable to 0 for re-check
      quest::stoptimer("skwt3");
      $shutc=undef;}
     if ($timer eq "skwt3"){
       quest::delglobal("shutc");
       quest::setglobal("shutc",0,7,"F");#Set timer variable to 0 for re-check
       quest::stoptimer("skwt3");
       $shutc=undef;}
   if (($timer eq "skwt4") && ($maidna <=40) && ($maidna==$maidnb)){
      # quest::shout("Supposed to spawn!");
      quest::delglobal("maidna");
      quest::setglobal("maidna",1,7,"F"); #No activity, so start MaidenVoyage.
      $maidna=undef;
      quest::spawn2(96301,30,0,-2930,-1435,-20,118.25);
      quest::stoptimer("skwt4");
      quest::delglobal("maidnc");
      quest::setglobal("maidnc",0,7,"F");#Set timer variable to 0 for re-check
      $maidnc=undef;}
     if ($timer eq "skwt4"){
       # quest::shout("In zone timer off!");
       quest::stoptimer("skwt4");
       quest::delglobal("maidnc");
       quest::setglobal("maidnc",0,7,"F");#Set timer variable to 0 for re-check
       $maidnc=undef;}
   if (($timer eq "skwt2") && ($skiffa >=0) && ($skiffa <=39) && ($skiffc==$skiffa)){
      quest::delglobal("skiffc");
      quest::setglobal("skiffc",0,7,"F"); #No activity, so start Skiff in Timorous (Set to 0).
      $skiffc=undef;
      quest::delglobal("skiffa");
      quest::setglobal("skiffa",40,7,"F");
      quest::stoptimer("skwt2");
      $skiffa=undef;}
   else{
      quest::delglobal("skiffc");
      quest::setglobal("skiffc",1,7,"F"); #Skiff must be in here, but set to 1 for a recheck
      quest::stoptimer("skwt2");
      $skiffc=undef;}}
      
  sub EVENT_ENTER{
   if (($skiffc ==0) || ($skiffa >=0) && ($skiffa <=39)){
    quest::delglobal("skiffc");
    quest::setglobal("skiffc",1,7,"F");
    $skiffc=undef;}}

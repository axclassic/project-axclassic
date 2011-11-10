## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar
sub EVENT_SPAWN { ## Starts in Oot return to Butcher
if (($sirens ==60) && ($sirens >=60) && ($sirens <=99)){ ##Oot
  if($debugpl){quest::shout("spawning, starting 69153.pl");}
 quest::spawn_condition(oot, 2,0); #BoatThere
 quest::spawn_condition(oot, 3,1);}
else{
 quest::spawn_condition(oot, 2,1); #BoatGone
 quest::spawn_condition(oot, 3,0);
 quest::depop();}}

sub EVENT_WAYPOINT {
## In Oot > FP ################################## In Oot > FP #################

if (($sirens==60) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout("telling 69154 to depop, ZONEING in From Butcher setting 61");}
 quest::signal(69154);
 quest::delglobal("sirens");
 quest::setglobal("sirens",61,7,"F");
 $sirens=undef;}
elsif (($sirens==61) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",62,7,"F");
 $sirens=undef;}
elsif (($sirens==62) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Setting 63");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",63,7,"F");
 $sirens=undef;}
elsif (($sirens==63) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",64,7,"F");
 $sirens=undef;}
elsif (($sirens==64) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",65,7,"F");
 $sirens=undef;}
elsif (($sirens==65) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",66,7,"F");
 $sirens=undef;}
elsif (($sirens==66) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",67,7,"F");
 $sirens=undef;}
elsif (($sirens==67) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",68,7,"F");
 $sirens=undef;}
elsif (($sirens==68) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",69,7,"F");
 $sirens=undef;}
elsif (($sirens==68) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Near Pier)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",70,7,"F");
 $sirens=undef;}
elsif (($sirens==69) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("AT Pier)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",70,7,"F");
 $sirens=undef;}
elsif (($sirens==70) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
   if($debugpl){quest::shout ("SET 71)");}
 quest::setglobal("sirens",71,7,"F");
 $sirens=undef;}
elsif (($sirens==71) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",72,7,"F");
 $sirens=undef;}
elsif (($sirens==72) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Setting 73");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",73,7,"F");
 $sirens=undef;}
elsif (($sirens==73) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",74,7,"F");
 $sirens=undef;}
elsif (($sirens==74) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",75,7,"F");
 $sirens=undef;}
elsif (($sirens==75) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",76,7,"F");
 $sirens=undef;}
elsif (($sirens==76) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",77,7,"F");
 $sirens=undef;}
elsif (($sirens==77) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",78,7,"F");
 $sirens=undef;}
elsif (($sirens==78) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",79,7,"F");
 $sirens=undef;}
elsif (($sirens==79) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",80,7,"F");
   if($debugpl){quest::shout ("SET 80)");}
 $sirens=undef;}
elsif (($sirens==80) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
   if($debugpl){quest::shout ("SET 81)");}
 quest::setglobal("sirens",81,7,"F");
 $sirens=undef;}
elsif (($sirens==81) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("SET 82)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",82,7,"F");
 $sirens=undef;}
elsif (($sirens==82) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("SET 83!)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",83,7,"F");
 $sirens=undef;}
elsif (($sirens==83) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("SET 84)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",84,7,"F");
 $sirens=undef;}
elsif (($sirens==84) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",85,7,"F");
 $sirens=undef;}
elsif (($sirens==85) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",86,7,"F");
 $sirens=undef;}
elsif (($sirens==86) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",87,7,"F");
 $sirens=undef;}
elsif (($sirens==87) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",88,7,"F");
 $sirens=undef;}
elsif (($sirens==88) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",89,7,"F");
 $sirens=undef;}
elsif (($sirens==89) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",90,7,"F");
 $sirens=undef;}
elsif (($sirens==90) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 91!)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",91,7,"F");
 $sirens=undef;}
elsif (($sirens==91) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",92,7,"F");
 $sirens=undef;}
elsif (($sirens==92) && ($sirens >=60) && ($sirens <=99)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",93,7,"F");
 $sirens=undef;}
elsif (($sirens==93) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 94!)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",94,7,"F");
 $sirens=undef;}
elsif (($sirens==94) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 95!");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",95,7,"F");
 $sirens=undef;}
elsif (($sirens==95) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 96!");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",96,7,"F");
 $sirens=undef;}
elsif (($sirens==96) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 97!");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",97,7,"F");
 $sirens=undef;}
elsif (($sirens==97) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 98-Near ZoneLine!)");}
 quest::settimer("boat2",10);
 quest::delglobal("sirens");
 quest::setglobal("sirens",98,7,"F");
 $sirens=undef;}
elsif (($sirens==98) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 99-Near ZoneLine!)");}
 quest::settimer("boat2",10);
 quest::delglobal("sirens");
 quest::setglobal("sirens",99,7,"F");
$sirens=undef;}
elsif (($sirens==99) && ($sirens >=60) && ($sirens <=99)){
   if($debugpl){quest::shout ("Set 100!");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",100,7,"F");
 $sirens=undef;}
else{
 quest::spawn_condition(oot,2,1); #BoatGone
 quest::spawn_condition(oot,3,0);
 quest::depop();}}

sub EVENT_TIMER{
 if ($timer eq "boat2"){
    if($debugpl){quest::shout ("Zoning to Freeport :)");}
  quest::spawn_condition(oot, 2,1); #BoatGone
  quest::spawn_condition(oot, 3,0);
  quest::stoptimer("boat2");}}

## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar
sub EVENT_SPAWN { ## Starts in FreportE

if (($sirens ==39) && ($sirens >=39) && ($sirens <=59)){ ##FpE
 quest::spawn_condition(freporte, 2,0); #BoatThere
 quest::spawn_condition(freporte, 1,1);}
else{
 quest::spawn_condition(freporte, 2,1); #BoatGone
 quest::spawn_condition(freporte, 1,0);}}

sub EVENT_WAYPOINT {
## In freporte > Butcher ####################### In freporte >Oot #################

if (($sirens ==39) && ($sirens >=39) && ($sirens <=59)){
 quest::shout("telling 10183 to depop");
 quest::signal(10183);
 quest::shout ("ZONEING in From oot setting 40");
 quest::delglobal("sirens");
 quest::setglobal("sirens",40,7,"F");
 $sirens=undef;}
elsif (($sirens==40) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",41,7,"F");
 $sirens=undef;}
elsif (($sirens==41) &&($sirens >=37) && ($sirens <=59)){
 quest::shout ("Setting 41");
 quest::delglobal("sirens");
 quest::setglobal("sirens",42,7,"F");
 $sirens=undef;}
elsif (($sirens==42) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",43,7,"F");
 $sirens=undef;}
elsif (($sirens==43) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",44,7,"F");
 $sirens=undef;}
elsif (($sirens==44) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",45,7,"F");
 $sirens=undef;}
elsif (($sirens==45) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",46,7,"F");
 $sirens=undef;}
elsif (($sirens==46) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",47,7,"F");
 $sirens=undef;}
elsif (($sirens==47) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",48,7,"F");
 $sirens=undef;}
elsif (($sirens==48) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",49,7,"F");
 $sirens=undef;}
elsif (($sirens==49) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::shout ("SET 50)");
 quest::setglobal("sirens",50,7,"F");
 $sirens=undef;}
elsif (($sirens==50) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",51,7,"F");
 $sirens=undef;}
elsif (($sirens==51) &&($sirens >=37) && ($sirens <=59)){
 quest::shout ("Setting 50");
 quest::delglobal("sirens");
 quest::setglobal("sirens",52,7,"F");
 $sirens=undef;}
elsif (($sirens==52) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",53,7,"F");
 $sirens=undef;}
elsif (($sirens==53) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",54,7,"F");
 $sirens=undef;}
elsif (($sirens==54) &&($sirens >=37) && ($sirens <=59)){  ##### TIMER ###
 quest::settimer("boat3",10);
 quest::shout ("Near ZoneLine Set 55!)");
 quest::delglobal("sirens");
 quest::setglobal("sirens",55,7,"F");
 $sirens=undef;}
elsif (($sirens==55) &&($sirens >=37) && ($sirens <=59)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",56,7,"F");
 $sirens=undef;}
 else{
 quest::spawn_condition(freporte, 2,1); #BoatGone
 quest::spawn_condition(freporte, 1,0);
 quest::depop();}}

sub EVENT_TIMER{
 if ($timer eq "boat3"){
  quest::shout ("Zoning to Oot!! :)");
  quest::delglobal("sirens");
  quest::shout ("Setting 60)");
  quest::setglobal("sirens",60,7,"F");
  $sirens=undef;
  quest::spawn_condition(freporte, 2,1); #BoatGone
  quest::spawn_condition(freporte, 1,0);
  quest::stoptimer("boat3")}};
  

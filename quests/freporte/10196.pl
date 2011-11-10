## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar

sub EVENT_DEATH {
 if(($sirens < 60) && ($sirens > 0)){
   if($debugpl){quest::shout("Zoning out!");}
   quest::delglobal("sirens");
   quest::setglobal("sirens",60,7,"F");
   $sirens=undef;}
 }

sub EVENT_WAYPOINT {
## In freporte > Butcher ####################### In freporte >Oot #################


if ($sirens ==40){
 if($debugpl){quest::shout("telling 10183 to depop");}
 quest::signal(10183);
 if($debugpl){quest::shout ("ZONEING in From oot setting 41");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",41,7,"F");
 $sirens=undef;}
elsif($sirens==41){
 quest::delglobal("sirens");
 quest::setglobal("sirens",42,7,"F");
 $sirens=undef;}
elsif($sirens==42){
 if($debugpl){quest::shout ("Setting 43");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",43,7,"F");
 $sirens=undef;}
elsif($sirens==43){
 quest::delglobal("sirens");
 quest::setglobal("sirens",44,7,"F");
 $sirens=undef;}
elsif($sirens==44){
 quest::delglobal("sirens");
 quest::setglobal("sirens",45,7,"F");
 $sirens=undef;}
elsif($sirens==45){
 quest::delglobal("sirens");
 quest::setglobal("sirens",46,7,"F");
 $sirens=undef;}
elsif($sirens==46){
 quest::delglobal("sirens");
 quest::setglobal("sirens",47,7,"F");
 $sirens=undef;}
elsif($sirens==47){
 quest::delglobal("sirens");
 quest::setglobal("sirens",48,7,"F");
 $sirens=undef;}
elsif ($sirens==48){
 quest::delglobal("sirens");
 quest::setglobal("sirens",49,7,"F");
 $sirens=undef;}
elsif ($sirens==49){
 quest::delglobal("sirens");
 quest::setglobal("sirens",50,7,"F");
 $sirens=undef;}
elsif($sirens==50){
 quest::delglobal("sirens");
 if($debugpl){quest::shout ("SET 50)");}
 quest::setglobal("sirens",51,7,"F");
 $sirens=undef;}
elsif($sirens==51){
 quest::delglobal("sirens");
 quest::setglobal("sirens",52,7,"F");
 $sirens=undef;}
elsif($sirens==52){
 if($debugpl){quest::shout ("Setting 53");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",53,7,"F");
 $sirens=undef;}
elsif($sirens==53){
 quest::delglobal("sirens");
 quest::setglobal("sirens",54,7,"F");
 $sirens=undef;}
elsif ($sirens==54){
 quest::delglobal("sirens");
 quest::setglobal("sirens",55,7,"F");
 $sirens=undef;}
elsif ($sirens==55){  ##### TIMER ###
 if($debugpl){quest::shout ("Near ZoneLine Set 56!)");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",56,7,"F");
 $sirens=undef;}
elsif($sirens==56){
 quest::delglobal("sirens");
 quest::setglobal("sirens",57,7,"F");
 $sirens=undef;}
elsif($sirens==57){
 quest::delglobal("sirens");
 quest::setglobal("sirens",58,7,"F");
 $sirens=undef;}
}

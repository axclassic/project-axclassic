# Zone to Butcher SirensBane event
# Zone: OOT
# AngeloX
# Qadar
sub EVENT_SPAWN{
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);}

sub EVENT_ENTER{
no warnings 'all' ;
    if((($sirens>=95) && ($sirens<=99)) || ($sirens == 0)){
     if($sirens !=0){
       quest::delglobal("sirens");
       quest::setglobal("sirens",100,7,"F");}
     #if($debugpl){quest::shout ("Zoning PC's to BUTCHERBLOCK Setting to 100!!!");}
     quest::movepc(68,3680,2010,23);}}

# Zone to Freporte SirensBane event
# Zone: OOT
# AngeloX
# Qadar
sub EVENT_SPAWN{
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);}

sub EVENT_ENTER{
    if(($sirens>=35) && ($sirens<=40)){
     if($debugpl){quest::shout ("Zoning PC's to FREEPORT Setting to 37!!!");}
     if($sirens != 40) {
       quest::delglobal("sirens");
       quest::setglobal("sirens",39,7,"F");}
     quest::movepc(10,-1617.4,-642.0,-30);}}

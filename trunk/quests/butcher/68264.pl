# Zone to OOT SirensBane event
# Zone: Butcher
# AngeloX

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);}

sub EVENT_ENTER{
    if(($sirens>=10) && ($sirens<=14.5)){
     if($sirens != 14.5){
       quest::delglobal("sirens");
       quest::setglobal("sirens",14,7,"F");
     }
     if($debugpl==1){quest::shout ("Zoning PC's to OOT!!!");}
     quest::movepc(69,10738.9,1138.8,13.7);}}

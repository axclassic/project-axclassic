# Zone to Oot SirensBane event
# Zone: FreportE
# AngeloX
# Qadar
sub EVENT_SPAWN{
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);}

sub EVENT_ENTER{
no warnings 'all' ;
    if (($sirens >=53) && ($sirens <=60.5)){
     if($sirens != 60.5){
       quest::delglobal("sirens");
       quest::setglobal("sirens",60,7,"F");}
     #if($debugpl){ quest::shout("Zoning PC's to Oot Setting to 60!!!");}
     quest::movepc(69,-10583.5,-3169.7,19.0);}}

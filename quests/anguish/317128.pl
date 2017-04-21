##Shaker 317128 ##
sub EVENT_SIGNAL { 
if($signal == 999) {
 $npc->CameraEffect(3000, 6, 0, 1); 
 quest::depop(); 
 } 
}
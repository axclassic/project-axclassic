sub EVENT_SPAWN{
quest::settimer(166,180);
}
sub EVENT_SIGNAL{
 if ($signal == 297) {
 my $a = quest::ChooseRandom(166297,166301);
 quest::spawn2($a,0,0,372.3,2168.3,137.3,103.8);
 }
 if ($signal == 298) {
 my $a = quest::ChooseRandom(166298,166303);
 quest::spawn2($a,0,0,516,1019,34.6,241.5);
 }
 if ($signal == 299) {
 my $a = quest::ChooseRandom(166299,166304);
 quest::spawn2($a,0,0,931.6,1384.9,83.1,209.5);
 }
 if ($signal == 300) {
 my $a = quest::ChooseRandom(166300,166305);
 quest::spawn2($a,0,0,268.2,2082.6,119.1,154.6);
 }
 }
 sub EVENT_TIMER{
 if($cloaktimer == 166){
   quest::depop(166296);
   quest::depopall(166297); 
   quest::depopall(166298); 
   quest::depopall(166299);
   quest::depopall(166300);
   quest::depopall(166301);
   quest::depopall(166303);
   quest::depopall(166304);
   quest::depopall(166305);
   quest::stoptimer(166);
   quest::depop();
   }
 }  
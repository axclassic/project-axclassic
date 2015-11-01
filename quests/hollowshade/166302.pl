sub EVENT_SPAWN{
quest::settimer(166,3600);
}
sub EVENT_SIGNAL{
 if ($signal == 297) {
 quest::spawn2(166301,0,0,372.3,2168.3,137.3,103.8);
 }
 if ($signal == 298) {
  quest::spawn2(166303,0,0,516,1019,34.6,241.5);
 }
 if ($signal == 299) {
  quest::spawn2(166304,0,0,931.6,1384.9,83.1,209.5);
 }
 if ($signal == 300) {
 quest::spawn2(166305,0,0,271.8,2078.3,118.7,154.6);
 }
 if ($signal == 301) {
 quest::spawn2(166306,0,0,372.3,2168.3,137.3,103.8);
 }
 if ($signal == 303) {
  quest::spawn2(166307,0,0,516,1019,34.6,241.5);
 }
 if ($signal == 304) {
  quest::spawn2(166308,0,0,931.6,1384.9,83.1,209.5);
 }
 if ($signal == 305) {
 quest::spawn2(166309,0,0,271.8,2078.3,118.7,154.6);
 }
  }
 sub EVENT_TIMER{
 if($cloaktimer == 166){
   quest::depop(166296);
   quest::depop(166297); 
   quest::depop(166298); 
   quest::depop(166299);
   quest::depop(166300);
   quest::depop(166301);
   quest::depop(166303);
   quest::depop(166304);
   quest::depop(166305);
   quest::depop(166306);
   quest::depop(166307);
   quest::depop(166308);
   quest::depop(166309);
   quest::stoptimer(166);
   quest::depop();
   }
 }  
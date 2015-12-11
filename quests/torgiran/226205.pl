my $luga_event = 0;

sub EVENT_SPAWN {
    $luga_event = 0;
  $counter = undef;
}  

sub EVENT_SIGNAL {
  if($signal == 44) {
       $luga_event += 1; 
     quest::settimer("lugatimer",1800);
}
   if($signal == 45) { 
       $counter += 1;
   if($counter == 45) {
    quest::spawn2(226228,0,0,-1346.9,1025.9,-137.3,10.1);
    quest::signalwith(226228,46,0);
    quest::depop(226047);
    quest::depop(226225);
    quest::depop(226226);
    quest::depop(226213);
    quest::spawn2(226210,0,0,-1316.6,1073.1,-147,254.8);
    quest::spawn2(226223,0,0,-1298.6,1080.4,-141,249.5);
    quest::spawn2(226224,0,0,-1329.5,1077.4,-147,249.5);
    quest::depop();
   }
 }
}
sub EVENT_TIMER{
if($timer eq "lugatimer"){
   quest::depop(226217);
   quest::depop(226218);
   quest::depop(226219);
   quest::depop(226220);
   quest::depop(226221);
   quest::depop(226222);
   quest::depop(226230);
   quest::depop(226231);
   quest::depop(226232);
   quest::depop(226233);
   quest::depop(226234);
   quest::depop(226235);
   quest::depop(226236);
   quest::depop(226237);
   quest::depop(226238);
   quest::depop(226239);
   quest::depop(226240);
   quest::depop(226241);
   quest::depop(226242);
   quest::depop(226243);
   quest::depop(226244);
   quest::depop(226245);
   quest::depop(226246);
   quest::depop(226247);
   quest::depop(226213);
   quest::depop(226047);
   quest::depop(226225);
   quest::depop(226226);
   quest::depop(226206);
   quest::stoptimer("lugatimer");
   quest::depop();
    $counter = 0;
 }
}

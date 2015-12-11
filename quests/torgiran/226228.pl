my $ngrub_event = 0;

sub EVENT_SPAWN {
    $ngrub_event = 0;
  $counter = undef;
}  

sub EVENT_SIGNAL {
  if ($signal == 46) {
    $ngrub_event += 1; 
    quest::settimer("ngrubtimer",1200);
}
if($signal == 47) { 
$counter += 1;
    if ($counter == 3) {
    quest::depop(226206);
    quest::spawn2(226248,0,0,-1314.3,1065.1,-147,254.4);
    quest::depop();
  }
 }
}
if($timer eq "ngrubtimer"){
   quest::depop(226210);
   quest::depop(226206);
   quest::depop(226223); 
   quest::depop(226224); 
   quest::depop(226248);
   quest::stoptimer("ngrubtimer");
   quest::depop();
    $counter = 0;
   }


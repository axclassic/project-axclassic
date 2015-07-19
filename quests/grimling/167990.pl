my $husman_second_event = 0;
 
sub EVENT_SPAWN {
  $husman_second_event = 0;
  $counter = undef;
    }
sub EVENT_SIGNAL {    
    if ($signal == 7222) {
     $husman_second_event += 1; # adds one to spawn variable # 
     }
     if($signal == 7224) {
     quest::depopall(167993);
     quest::depopall(167971);
     quest::depopall(167972);
     quest::depopall(167973);
     quest::depopall(167985);
     quest::depopall(167986);
     quest::depopall(167987);
     quest::depop(167966);
     quest::depop(167989);
     quest::depop();
     }
     if($signal == 7225) { 
          $counter += 1;
    if($counter == 8) {
     quest::depopall(167971);
     quest::depopall(167972);
     quest::depopall(167973);
     quest::spawn2(167996,0,0,676.7,-662.9,-4.1,144.4);
     quest::spawn2(167994,0,0,623.3,-656.3,-9.5,157.6);
     quest::spawn2(167995,0,0,601.5,-629.6,-18.6,182.6);
     quest::spawn2(167996,0,0,570.9,-594.6,-14.5,165.4);
     quest::spawn2(167994,0,0,579.6,-775.5,-16.4,41.6);
     quest::spawn2(167995,0,0,529.8,-730.3,-20.1,33.6);
     quest::spawn2(167996,0,0,493.3,-678.9,-23.5,61);
     quest::spawn2(167994,0,0,469.7,-647.9,-14.5,58.4);
     }
    if($counter == 16) {
     quest::spawn2(167966,0,0,574.4,-674.5,-33.5,156.4);
   }
   if($counter == 17) {
    quest::signalwith(167992,7226,0);
    quest::depop(167989);
    quest::depop();
   }
 }
}
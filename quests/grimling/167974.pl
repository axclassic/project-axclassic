my $husman_event = 0;
 
sub EVENT_SPAWN {
  $husman_event = 0;
  $counter = undef;
    }
sub EVENT_SIGNAL {    
    if ($signal == 7202) {
     $husman_event += 1; # adds one to spawn variable # 
     }
     if($signal == 7204) {
     quest::depopall(167970);
     quest::depopall(167971);
     quest::depopall(167972);
     quest::depopall(167973);
     quest::depopall(167985);
     quest::depopall(167986);
     quest::depopall(167987);
     quest::depop(167964);
     quest::depop(167979);
     quest::depop();
     }
     if($signal == 7205) { 
          $counter += 1;
    if($counter == 10) {
     quest::depopall(167971);
     quest::depopall(167972);
     quest::depopall(167973);
     quest::spawn2(167976,0,0,-1343.9,522.5,58.4,98.4);
     quest::spawn2(167977,0,0,-1346.8,595.7,76,93.1);
     quest::spawn2(167978,0,0,-1296.4,635.3,66.4,117.1);
     quest::spawn2(167976,0,0,-1243,660.7,62.8,126.8);
     quest::spawn2(167977,0,0,-1171.3,663.7,72.2,148.1);
     quest::spawn2(167978,0,0,-1110.8,630.4,60.8,143.5);
     quest::spawn2(167976,0,0,-1149.5,589.5,37.1,138.4);
     quest::spawn2(167977,0,0,-1217.7,613.9,36.2,122.5);
     quest::spawn2(167978,0,0,-1268.6,613.4,44.6,124.8);
     quest::spawn2(167976,0,0,-1309.6,570.9,39.1,115.5);
     }
    if($counter == 20) {
    quest::spawn2(167964,0,0,-1245.7,499.5,39.8,250.6);
   }
   if($counter == 21) {
    quest::signalwith(167975,7206,0);
    quest::depop(167979);
    quest::depop();
   }
 }
}



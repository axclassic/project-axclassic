my $husman_second_event = 0;
 
sub EVENT_SPAWN {
  $husman_second_event = 0;
  $counter = undef;
    }
sub EVENT_SIGNAL {    
    if ($signal == 7212) {
     $husman_second_event += 1; # adds one to spawn variable # 
     }
     if($signal == 7214) {
     quest::depopall(167984);
     quest::depopall(167971);
     quest::depopall(167972);
     quest::depopall(167973);
     quest::depopall(167985);
     quest::depopall(167986);
     quest::depopall(167987);
     quest::depop(167965);
     quest::depop(167982);
     quest::depop();
     }
     if($signal == 7215) { 
          $counter += 1;
    if($counter == 15) {
     quest::depopall(167971);
     quest::depopall(167972);
     quest::depopall(167973);
     quest::spawn2(167987,0,0,-1006,917.1,37.5,53.4);
     quest::spawn2(167985,0,0,-1040.5,929,41.4,37.6);
     quest::spawn2(167986,0,0,-1082.2,956.2,33.2,52.6);
     quest::spawn2(167987,0,0,-1103.4,989.8,18.7,24);
     quest::spawn2(167985,0,0,-1151.6,1004.1,20.5,49.1);
     quest::spawn2(167986,0,0,-1184.6,1011.7,26.9,55);
     quest::spawn2(167987,0,0,-1200.8,1036.4,29.1,61.5);
     quest::spawn2(167985,0,0,-1224.5,1064.6,32.3,76.2);
     quest::spawn2(167986,0,0,-1236.9,1116.1,31.2,80.1);
     quest::spawn2(167987,0,0,-1244.4,1154,29.2,87.1);
     quest::spawn2(167985,0,0,-1220.1,1207.9,26.8,88.2);
     quest::spawn2(167986,0,0,-1188.9,1236.2,41.1,115.9);
     quest::spawn2(167987,0,0,-1152.6,1206.6,30.1,126.1);
     quest::spawn2(167985,0,0,-1240.2,1171.3,25.9,72.8);
     quest::spawn2(167986,0,0,-976.5,926.7,30.2,26.8);
     }
    if($counter == 30) {
     quest::spawn2(167965,0,0,-1086.1,1085.6,4.7,70.4);
   }
   if($counter == 31) {
    quest::signalwith(167980,7216,0);
    quest::depop(167982);
    quest::depop();
   }
 }
}
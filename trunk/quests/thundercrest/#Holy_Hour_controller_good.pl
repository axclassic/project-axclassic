my $holy_hour_event = 0;

 
  sub EVENT_SPAWN {
  $holy_hour_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 665) {
	 $holy_hour_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 666) { ##signal 666 is from each mob who dies before reaching the other side of bridge##
    $counter += 1;
	   if($counter == 50) {
	quest::spawn2(340142,0,0,894.4,1324.5,-0.5,160);
    quest::spawn2(340143,0,0,813.4,1293.6,0.1,110.5);
    quest::spawn2(340143,0,0,872.3,1234.1,9.1,220);	
	quest::depop(340081);
	quest::depop(340082);
	quest::depop(340083);
    quest::depop(340084);
    quest::depop(340085);
	quest::depop(340086);
	quest::depop(340087);
	quest::depop(340079);
    quest::depop();	
	}
   }
 }
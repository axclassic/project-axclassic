my $krill_event = 0;

 
  sub EVENT_SPAWN {
  $krill_event = 0;
  $counter = undef;
    }
sub EVENT_SIGNAL {    
    if ($signal == 224) {
	 $krill_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 225) { 
    $counter += 1;
	   if($counter == 3) {
	quest::spawn2(224244,0,0,-290,-513.4,18.2,217.2);
	quest::signalwith(224244,226,0);
	quest::spawn2(224245,0,0,-292.5,-458.2,17,154.9);
	quest::signalwith(224245,227,0);
	quest::spawn2(224246,0,0,-279.9,-483.5,17,184.4);
	quest::signalwith(224246,228,0);
	}
	   if($counter == 6) {
	quest::spawn2(224244,0,0,-290,-513.4,18.2,217.2);
	quest::signalwith(224244,226,0);
	quest::spawn2(224245,0,0,-292.5,-458.2,17,154.9);
	quest::signalwith(224245,227,0);
	quest::spawn2(224246,0,0,-279.9,-483.5,17,184.4);
	quest::signalwith(224246,228,0);
	}
	   if($counter == 9) {
	quest::spawn2(224249,0,0,-290,-513.4,18.2,217.2);
	quest::signalwith(224249,230,0);
	quest::spawn2(224245,0,0,-292.5,-458.2,17,154.9);
	quest::signalwith(224245,227,0);
	quest::spawn2(224246,0,0,-279.9,-483.5,17,184.4);
	quest::signalwith(224246,228,0);
	}
	if($counter == 12) {
	quest::spawn2(224247,0,0,-277.1,-463.6,18.2,163);
	quest::signalwith(224243,229,6000);
   }
  }
}



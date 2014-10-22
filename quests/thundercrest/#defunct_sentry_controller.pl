my $defunct_sentry_event = 0;

 
  sub EVENT_SPAWN {
  $defunct_sentry_event = 0;
  $counter = undef;

$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {	
$client->Message(14,"You must now destroy the remaining defunct sentrys.");
quest::spawn2(340000,0,0,1975.6,-452.4,125.5,58.1);
quest::spawn2(340001,0,0,2260.7,-206.9,125.5,199.1);
quest::spawn2(340002,0,0,2259.8,-727.2,125.5,199.1);
  }
sub EVENT_SIGNAL {
    if($signal == 9050){
    quest::signalwith(340114,9075,0);	
    }
   	if ($signal == 910) {
	 $defunct_sentry_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 911) { ##signal 911 is from each a_Defunct_Sentry##
    $counter += 1;
	   if($counter == 3) {
	quest::spawn2(340027,0,0,2436,-744,176,0.0);
	quest::signalwith(340114,9000,0);
	}
	if($signal == 911) { #signal 911 is from Furious Sentry#
      if($counter == 4) {
	quest::spawn2(340111,0,0,503.2,-788.3,111.5,231.9); #spawn creator proximity controller#
	quest::depop(340114);
	quest::depop();
	}
  }
 }
}

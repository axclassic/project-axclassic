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
quest::spawn2(340000,0,0,1932.8,-475.3,112.6,190);
quest::spawn2(340001,0,0,2160.3,-248.3,121.9,169.8);
quest::spawn2(340002,0,0,2081.6,699.5,121.9,21.4);
  }
sub EVENT_SIGNAL {
   	if ($signal == 910) {
	 $defunct_sentry_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 911) { ##signal 911 is from each a_Defunct_Sentry##
    $counter += 1;
	   if($counter == 3) {
	quest::spawn2(340027,0,0,2436,-744,176,0.0);
	quest::signalwith(340114,912,0);
	quest::signalwith(340115,912,0);
	quest::signalwith(340116,912,0);
	}
	if($signal == 911) { #signal 911 is from Furious Sentry#
      if($counter == 4) {
	quest::spawn2(340111,0,0,503.2,-788.3,111.5,231.9); #spawn creator proximity controller#
	quest::depop(340114);
	quest::depop(340115);
	quest::depop(340116);
	quest::depop();
	}
   }
 }
}
my $defunct_sentry_event = 0;
my $c = $entity_list->GetMobID;
 
  sub EVENT_SPAWN {
  $defunct_sentry_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
   	if ($signal == 910) {
	 $defunct_sentry_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 911) { ##signal 911 is from each a_Defunct_Sentry##
    $counter += 1;
	   if($counter == 3) {
	quest::spawn2(340027,0,0,2436,-744,176,0.0);
	$npc->CameraEffect(3000, 6);
	$client->Message(14,"Something has come alive in a nearby room! Be warned!" );
	$client->Message(14,"The rumbling you just felt must have been a sentry that is fully automated! Judging by the magnitude of the power, it must be nearby. Search for this beast and destroy it before it has a chance to destroy you!"); 

    }
	if($signal == 911) { #signal 911 is from Furious Sentry#
      if($counter == 4) {
	quest::spawn2(340111,0,0,503.2,-788.3,111.5,231.9); #spawn creator proximity controller#
	quest::depop();
	}
   }
 }
}
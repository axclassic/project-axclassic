##128146 Overseer event controller##
##128141 a vigilant custodian##
##128142 a watchful custodian##
##128143 a warren protector##
##128144 a lair protector##
##128145 The Overseer##



my $Overseer_event = 0;

 
  sub EVENT_SPAWN {
  $Overseer_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if($signal == 1285) { ##signal 1285 is that The Overseer has spawned##
    quest::depop(); 
    }	
    if($signal == 1284) { ##signal 1284 is from each of the each of the NPC's on the balcony level##
    $counter += 1;
	   if($counter == 9) {
	quest::spawn2(128145,0,0,384.6,-367.3,101.9,129);
	quest::depop();
    }	
	}
 }



##128150 Sinister_Gargoyle_event_controller##
##128098  Sinister Gargoyle##
##128148 an ancient caretaker##
##128149 an ancient caretaker##

my $Sinister_Gargoyle_event = 0;

 
  sub EVENT_SPAWN {
  $Sinister_Gargoyle_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if($signal == 1287) { ##signal 1285 is that a Sinister Gargoyle has spawned##
    quest::depop(); 
    }	
    if($signal == 1286) { ##signal 1284 is from each of the each of the an aged caretaker ID 128167 only##
    $counter += 1;
	   if($counter == 2) {
	quest::spawn2(128098,0,0,1288.2,-1472,-125.8,0);
	quest::depop();
    }	
	}
 }
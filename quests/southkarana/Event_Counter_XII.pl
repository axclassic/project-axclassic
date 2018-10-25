##Event_Counter_XII 14233 spawns 2 rounds of wild turkeys and depops Corny Scarecrow ## 
sub EVENT_SPAWN {
my $Turkeyday_event = 0;
 $counter = undef;
  }
sub EVENT_SIGNAL {
    if($signal == 713) { ##signal 713 is from Corny Scarecrow to start event##
	quest::spawn2(14219,0,0,547.9,508.5,-2.8,79);
	quest::spawn2(14219,0,0,534.1,493.7,-2.8,67);
	quest::spawn2(14219,0,0,521.5,471.6,-2.8,59.5);
	quest::spawn2(14219,0,0,521.7,449.5,-2.8,53.1);
	quest::spawn2(14219,0,0,526.4,437.6,-2.8,40.6);
	}
   if($signal == 734) { ##signal 715 is from each mob who dies##
         $counter += 1;
   if($counter == 5) {
	quest::spawn2(14219,0,0,547.9,508.5,-2.8,79);
	quest::spawn2(14219,0,0,534.1,493.7,-2.8,67);
	quest::spawn2(14218,0,0,521.5,471.6,-2.8,59.5);
	quest::spawn2(14219,0,0,521.7,449.5,-2.8,53.1);
	quest::spawn2(14219,0,0,526.4,437.6,-2.8,40.6);
	}
   if($counter == 10) {
	$counter = undef;
	quest::depop();
	}
    if($signal == 754) { ##signal that player died##
    quest::depopall(14219);	
	quest::depop(14218);
	$counter = undef;
	quest::depop();	
	
   }
 }
}
 
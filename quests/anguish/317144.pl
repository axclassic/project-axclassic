##hanvar Control 317144##
sub EVENT_SPAWN {
my $hanvar_event = 0;
 $counter = undef;
  }
sub EVENT_SIGNAL {
   if($signal == 502) { ##signal 502 is from each mob who dies##
         $counter += 1;
   if($counter == 5) {
	quest::spawn2(317139,0,0,439.6,4387.7,207.7,70);
	quest::depop(317145);
	}
   if($counter == 10) {
	quest::spawn2(317140,0,0,439.6,4387.7,207.7,70);
	quest::depop(317142);
	}  
   if($counter == 15) {
	quest::spawn2(317141,0,0,439.6,4387.7,207.7,70);
	quest::depop(317142);
	}
   if($counter == 20) {
	quest::spawn2(317143,0,0,439.6,4387.7,207.7,70);
	quest::depop(317142);
	quest::depop(317146);
	  $counter = 0;
	quest::depop();
   }
  }
}  
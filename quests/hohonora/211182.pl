##The_Chaos_Timer 211182##
sub EVENT_SPAWN {
my $chaos_event = 0;
 $counter = undef;
quest::settimer("Chaospop",1800);
}
sub EVENT_SIGNAL {
   if($signal == 211) { ##signal 211 is from each mob who dies##
         $counter += 1;
   if($counter == 6) {  
    quest::depop(211199);
    quest::spawn2(211181,0,0,-1374.8,-2265.3,1,254.5);
	}
	}
	}
sub EVENT_TIMER {
   if($timer eq "Chaospop"){
   quest::stoptimer("Chaospop");
    quest::depopall(211172);
	  $counter =0
    quest::depop();
 }
 }
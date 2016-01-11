
##Northen Cave area spawn##
my $wolves_kill_owlbears_fail_event = 0;

 
  sub EVENT_SPAWN {
  $wolves_kill_owlbears_fail_event = 0;
  $counter = undef;
  }

sub EVENT_SIGNAL {
if ($signal == 2120) {
	 $wolves_kill_owlbears_fail_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 2121) { 
    $counter += 1;
	   if($counter == 5) {
       quest::depopall(166406);
       quest::depopall(166311);
       quest::spawn2(166487,0,0,1186.9,2198.8,178.2,189.8); #an_owlbear_defender
       quest::spawn2(166585,0,0,1187.5,2177,173.8,191.5); #an_owlbear_defender
       quest::spawn2(166586,0,0,1190,2159.2,171,185.6); #an_owlbear_defender
       quest::spawn2(166587,0,0,1195,2139.7,169.7,191.6); #an_owlbear_defender
       quest::spawn2(166588,0,0,1194.6,2117.5,167.9,194.8); #an_owlbear_defender
       quest::signalwith(166405,204,0);
       quest::depop(166315);
    $wolves_kill_owlbears_fail_event == 0;
       quest::depop();
     }
   }
 }







##South Village area Wolves kill Grimlings##
my $owlbears_kill_grimlings_at_south_village_fail_event = 0;


  sub EVENT_SPAWN {
  $owlbears_kill_grimlings_at_south_village_fail_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
if ($signal == 7120) {
$wolves_kill_grimlings_at_south_village_fail_event += 1; # adds one to spawn variable #
   }
if($signal == 7121) { 
    $counter += 1;
	   if($counter == 5) {
       quest::depopall(166565);
       quest::depopall(166298);
       quest::spawn2(166567,0,0,-668.7,-2622.6,11.8,229.4); #a grimling_defender
       quest::spawn2(166568,0,0,-659.2,-2614.8,12,230.5); #a grimling_defender
       quest::spawn2(166569,0,0,-645.9,-2603.7,11.8,237); #a grimling_defender
       quest::spawn2(166570,0,0,-636.8,-2596.4,9.6,245.1); #a grimling_defender
       quest::spawn2(166571,0,0,-618.5,-2583.2,5.3,242.4); #a grimling_defender
       quest::signalwith(166821,505,0);
       quest::depop(166824);
         $wolves_kill_grimlings_at_south_village_fail_event == 0;
       quest::depop();
     }
   }
 }



##Eastern Cave area spawn##
my $owls_kill_wolves_at_east_cave_fail_event = 0;


  sub EVENT_SPAWN {
  $owls_kill_wolves_at_east_cave_fail_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
if ($signal == 4120) {
$owls_kill_wolves_at_east_cave_fail_event += 1; # adds one to spawn variable #
   }
if($signal == 4121) { 
    $counter += 1;
	   if($counter == 5) {
       quest::depopall(166403);
       quest::depopall(166139);
       quest::spawn2(166654,0,0,-2741.9,587.7,48.4,48.8); #a_sonic_wolf_defender
       quest::spawn2(166651,0,0,-2741.9,572.1,48.4,51); #a_sonic_wolf_defender
       quest::spawn2(166650,0,0,-2738.8,557,48.1,32.1); #a_sonic_wolf_defender
       quest::spawn2(166652,0,0,-2743.9,536.6,48,77); #a_sonic_wolf_defender
       quest::spawn2(166653,0,0,-2741.7,520.5,47.6,79.8); #a_sonic_wolf_defender
       quest::signalwith(166663,704,0);
       quest::depop(166661);
         $owls_kill_wolves_at_east_cave_fail_event == 0;
       quest::depop();
     }
   }
 }



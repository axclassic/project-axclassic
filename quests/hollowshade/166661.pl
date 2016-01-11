##Eastern Cave area Owls kill Wolves spawn##

my $owlbears_kill_wolves_east_cave = 0;

 
  sub EVENT_SPAWN {
  $owlbears_kill_wolves_east_cave = 0;
  $counter = undef;
  $owlbears_kill_wolves_east_cave += 1;	# adds one to spawn variable #
  }
sub EVENT_SIGNAL {
    
	if($signal == 350) { ##signal 350 is from each sonic_wolf_defender##
    $counter += 1;
	   if($counter == 5) {
my $a = quest::ChooseRandom(166720,166669,166670);
my $b = quest::ChooseRandom(166671,166672,166673,166674);
my $c = quest::ChooseRandom(166675,166676,166677,166678);
my $d = quest::ChooseRandom(166679,166680,166681);
my $e = quest::ChooseRandom(166682,166683,166684);
my $f = quest::ChooseRandom(166685,166686,166687,166688);
my $g = quest::ChooseRandom(166689,166690,166691,166692);
my $h = quest::ChooseRandom(166693,166694,126695,126696);
my $i = quest::ChooseRandom(166697,166698,166699,166700);
my $j = quest::ChooseRandom(166701,166702,166703);
my $k = quest::ChooseRandom(166704,166705,166706);
my $l = quest::ChooseRandom(166707,166708,166709);
my $m = quest::ChooseRandom(166710,166711,166712);
my $n = quest::ChooseRandom(166713,166714,166715);
my $o = quest::ChooseRandom(166716,166717,166718);
   quest::signalwith(166663,702,0);
   quest::depopall(166403);
   quest::depop(166669);
   quest::depop(166670);
   quest::depop(166672);
   quest::depop(166673);
   quest::depop(166674);
   quest::depop(166656);
   quest::depop(166657);
   quest::depop(166658);
   quest::depop(166602);
   quest::depop(166603);
   quest::depop(166604);
   quest::depop(166605);
   quest::depop(166606);
   quest::depop(166607);
   quest::depop(166608);
   quest::depop(166609);
   quest::depop(166610);
   quest::depop(166611);
   quest::depop(166612);
   quest::depop(166613);
   quest::depop(166614);
   quest::depop(166615);
   quest::depop(166616);
   quest::depop(166617);
   quest::depop(166618);
   quest::depop(166619);
   quest::depop(166620);
   quest::depop(166621);
   quest::depop(166622);
   quest::depop(166623);
   quest::depop(166624);
   quest::depop(166625);
   quest::depop(166626);
   quest::depop(166627);
   quest::depop(166628);
   quest::depop(166629);
   quest::depop(166630);
   quest::depop(166631);
   quest::depop(166632);
   quest::depop(166633);
   quest::depop(166634);
   quest::depop(166635);
   quest::depop(166636);
   quest::depop(166637);
   quest::depop(166638);
   quest::depop(166639);
   quest::depop(166640);
   quest::depop(166641);
   quest::depop(166642);
   quest::depop(166643);
   quest::depop(166644);
   quest::depop(166645);
   quest::depop(166646);
   quest::depop(166647);
   quest::depop(166648);
   quest::spawn2($a,0,0,-2969.5,466.9,55.6,24.6); #an owlbear fleshrender Skriat Chee an owlbear fleshrender
   quest::spawn2($b,0,0,-2887.4,627.4,71.1,132.4); #an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::spawn2($c,0,0,-2997.8,516.2,54,35); #an owlbear ravager an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($d,0,0,-3002.5,573.7,52.7,63.5); #an owlbear bonegrinder an owlbear grappler an owlbear ravager
   quest::spawn2($e,0,0,-3113.2,618.4,64.2,99.1); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($f,0,0,-2991.5,666.2,62,109); #an owlbear fleshrender an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::spawn2($g,0,0,-2942.5,670.6,64.7,129.9); #an owlbear razorbeak an owlbear razorclaw an owlbear bonegrinder an owlbear grappler
   quest::spawn2($h,0,0,-2906.6,663.3,71.5,153.9); #an owlbear fleshrender an owlbear grappler an owlbear ravager an owlbear fleshrender
   quest::spawn2($i,0,0,-2867.1,582.8,69.9,159); #an owlbear grappler an owlbear ravager an owlbear fleshrender an owlbear fleshrender
   quest::spawn2($j,0,0,-2832.2,572.7,70.1,89.4); #an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::spawn2($k,0,0,-2929.9,409,71.2,5.1); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($l,9,0,-2887.4,477.7,71,227.1); #an owlbear bonegrinder an owlbear grappler an owlbear ravager
   quest::spawn2($m,0,0,-2845.7,507.9,70.4,20.9); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($n,0,0,-2932.2,525,55.8,62.2); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($o,0,0,-2931.4,584.7,54.5,77.4); #an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::depop(166662);
    $owlbears_kill_wolves_east_cave == 0;
   quest::depop();
  }
 }
}


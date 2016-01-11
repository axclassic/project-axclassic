##Eastern Cave area Owls kill Wolves spawn##

my $owlbears_kill_wolves_east_cave = 0;

 
  sub EVENT_SPAWN {
  $owlbears_kill_wolves_east_cave = 0;
  $counter = undef;
  $owlbears_kill_wolves_east_cave += 1;	# adds one to spawn variable #
  }
sub EVENT_SIGNAL {
    
	if($signal == 450) { ##signal 450 is from each sonic_wolf_defender##
    $counter += 1;
	   if($counter == 5) {
my $a = quest::ChooseRandom(166233,166601,166600);
my $b = quest::ChooseRandom(166509,166561,166496,166528);
my $c = quest::ChooseRandom(166510,166529,166497,166538);
my $d = quest::ChooseRandom(166511,166530,166498);
my $e = quest::ChooseRandom(166512,166531,166499);
my $f = quest::ChooseRandom(166513,166532,166514,166500);
my $g = quest::ChooseRandom(166515,166534,166562,166501);
my $h = quest::ChooseRandom(166516,166535,126517,126502);
my $i = quest::ChooseRandom(166518,166728,166563,166503);
my $j = quest::ChooseRandom(166730,166526,166504);
my $k = quest::ChooseRandom(166519,166539,166506);
my $l = quest::ChooseRandom(166520,166532,166507);
my $m = quest::ChooseRandom(166725,166540,166541);
my $n = quest::ChooseRandom(166542,166724,166726);
my $o = quest::ChooseRandom(166521,166540,166508);
   quest::signalwith(166633,703,0);
   quest::depopall(166256);
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
   quest::spawn2($a,0,0,-2969.5,466.9,55.6,24.6); #grimling tribal leader Grurn No Eyes Fabled Grurn No Eyes
   quest::spawn2($b,0,0,-2887.4,627.4,71.1,132.4); #a grimling conqueror a grimling spiritist a grimling thief a grimling soldier
   quest::spawn2($c,0,0,-2997.8,516.2,54,35); #a grimling conqueror a grimling soldier a grimling thief a grimling overseeer
   quest::spawn2($d,0,0,-3002.5,573.7,52.7,63.5); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($e,0,0,-3113.2,618.4,64.2,99.1); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($f,0,0,-2991.5,666.2,62,109); #a grimling conqueror a grimling soldier a grimling conqueror a grimling thief
   quest::spawn2($g,0,0,-2942.5,670.6,64.7,129.9); #a grimling conqueror a grimling soldier a grimling spiritist a grimling thief
   quest::spawn2($h,0,0,-2906.6,663.3,71.5,153.9); #a grimling conqueror a grimling soldier a grimling conqueror a grimling thief
   quest::spawn2($i,0,0,-2867.1,582.8,69.9,159); #a grimling conqueror a grimling soldier a grimling spiritist a grimling thief
   quest::spawn2($j,0,0,-2832.2,572.7,70.1,89.4); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($k,0,0,-2929.9,409,71.2,5.1); #a grimling conqueror a grimling overseeer a grimling thief
   quest::spawn2($l,9,0,-2887.4,477.7,71,227.1); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($m,0,0,-2845.7,507.9,70.4,20.9); #a grimling conqueror a grimling overseeer a grimling overseeer
   quest::spawn2($n,0,0,-2932.2,525,55.8,62.2); #a grimling overseeer a grimling conqueror a grimling thief
   quest::spawn2($o,0,0,-2931.4,584.7,54.5,77.4); #a grimling conqueror a grimling overseeer a grimling thief
   quest::depop(166722);
    $owlbears_kill_wolves_east_cave == 0;
   quest::depop();
  }
 }
}


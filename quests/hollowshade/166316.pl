##Northen Cave area Grimlings kill Owls spawn##

my $hollowshade_war_event_grimlings_kill_owlbears = 0;

 
  sub EVENT_SPAWN {
  $hollowshade_war_event_grimlings_kill_owlbears = 0;
  $counter = undef;
$hollowshade_war_event_grimlings_kill_owlbears += 1;	# adds one to spawn variable #
  }
sub EVENT_SIGNAL {
    
	if($signal == 250) { ##signal 250 is from each an_owlbear_defender##
    $counter += 1;
	   if($counter == 5) {
my $a = quest::ChooseRandom(166496,166509,166527,166538);
my $b = quest::ChooseRandom(166497,166510,166528,166539);
my $c = quest::ChooseRandom(166498,166511,166529,166540);
my $d = quest::ChooseRandom(166499,166512,166530,166541);
my $e = quest::ChooseRandom(166501,166513,166531,166542);
my $f = quest::ChooseRandom(166502,166514,166532,166544);
my $g = quest::ChooseRandom(166503,166515,166533,166545);
my $h = quest::ChooseRandom(166504,166516,166534,166546);
my $i = quest::ChooseRandom(166495,166494);
my $j = quest::ChooseRandom(166553,166554);
my $k = quest::ChooseRandom(166505,166535,166547);
my $l = quest::ChooseRandom(166572,166573);
my $m = quest::ChooseRandom(166506,166517,166536,166548);
my $n = quest::ChooseRandom(166507,166518,166537);
my $o = quest::ChooseRandom(166508,166519);
my $p = quest::ChooseRandom(166555,166558);
my $q = quest::ChooseRandom(166556,166559);
my $r = quest::ChooseRandom(166557,166560);
my $s = quest::ChooseRandom(166561,166562);
   quest::depopall(166574);
   quest::signalwith(166405,203,0);
   quest::depopall(166575);
   quest::depop(166407);
   quest::depop(166408);
   quest::depop(166409);
   quest::depop(166410);
   quest::depop(166411);
   quest::depop(166412);
   quest::depop(166413);
   quest::depop(166414);
   quest::depop(166415);
   quest::depop(166416);
   quest::depop(166417);
   quest::depop(166418);
   quest::depop(166419);
   quest::depop(166420);
   quest::depop(166421);
   quest::depop(166422);
   quest::depop(166423);
   quest::depop(166424);
   quest::depop(166425);
   quest::depop(166426);
   quest::depop(166427);
   quest::depop(166428);
   quest::depop(166429);
   quest::depop(166430);
   quest::depop(166431);
   quest::depop(166432);
   quest::depop(166433);
   quest::depop(166434);
   quest::depop(166435);
   quest::depop(166436);
   quest::depop(166437);
   quest::depop(166438);
   quest::depop(166439);
   quest::depop(166440);
   quest::depop(166441);
   quest::depop(166442);
   quest::depop(166443);
   quest::depop(166444);
   quest::depop(166445);
   quest::depop(166446);
   quest::depop(166447);
   quest::depop(166448);
   quest::depop(166449);
   quest::depop(166450);
   quest::depop(166451);
   quest::depop(166452);
   quest::depop(166453);
   quest::depop(166454);
   quest::depop(166455);
   quest::depop(166456);
   quest::depop(166457);
   quest::depop(166458);
   quest::depop(166459);
   quest::depop(166460);
   quest::depop(166461);
   quest::depop(166462);
   quest::depop(166463);
   quest::depop(166464);
   quest::depop(166465);
   quest::depop(166466);
   quest::depop(166467);
   quest::depop(166468);
   quest::depop(166469);
   quest::depop(166470);
   quest::depop(166471);
   quest::depop(166474);
   quest::depop(166475);
   quest::depop(166477);
   quest::depop(166478);
   quest::depop(166479);
   quest::depop(166480);
   quest::depop(166481);
   quest::depop(166585);
   quest::depop(166586);
   quest::depop(166587);
   quest::depop(166588);
   quest::depop(166487);
   quest::depop(166489);
   quest::depop(166491);
   quest::depop(166492);
   quest::depop(166493);
   quest::depop(166659);
   quest::depop(166660);
   quest::depop(166665);
   quest::spawn2($a,0,0,1735.3,3406.9,,166.4,145.1); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($b,0,0,1793.5,3391.5,,160.8,159); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($c,0,0,1751.2,2885.1,,163.7,199.6); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($d,0,0,1526.7,2495.8,164.7,112); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($e,4,0,1376.4,2167.1,163.3,48.2); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($f,0,0,1827.9,3639.5,158.3,127.1); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($g,0,0,1800.9,3181.9,158.1,64.6); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($h,0,0,1729.7,3499.8,158.7,65); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($i,0,0,1983,3537,158.3,178); #a_grimling_guard Griktar_Grimwit
   quest::spawn2($j,498009,0,1443.9,1270,150.5,246.7); #a_grimling_grunt
   quest::spawn2($k,498093,0,1498.9,936,53.1,279.5); #a_grimling_thief a_grimling soldier a_grimling_overseer
   quest::spawn2($l,9,0,904.7,2337.1,245.3,142.5); #a_grimling_conqueror
   quest::spawn2($m,0,0,1893.1,3077.7,162.3,248.5); #a_grimling_thief a_grimling_conqueror a_grimling soldier a_grimling_overseer
   quest::spawn2($n,0,0,1534.5,2806.4,164.1,81.6); #a_grimling_thief a_grimling_conqueror a_grimling soldier
   quest::spawn2($o,0,0,2072.1,3100.1,154.5,219.6); #a_grimling_thief a_grimling_conqueror
   quest::spawn2($p,3,0,1126.5,2150,143.9,63); #a_grimling_recruit a_patrolling_recruit
   quest::spawn2($q,0,0,1542.4,2979.7,171.5,98); #a_grimling_recruit a_patrolling_recruit
   quest::spawn2($r,0,0,2002,3027,152.5,243.4); #a_grimling_recruit a_patrolling_recruit
   quest::spawn2($s,49808,0,1265.8,2169.8,172,371); #a_grimling_spiritist
   quest::spawn2(166549,0,0,1996.1,3623.3,166.6,124.4); #a_grimling_overseer
   quest::spawn2(166667,0,0,398,1942,133.1,25.5); #a_grimling_thief
   quest::spawn2(166520,0,0,1618.4,2593.6,162.9,153.1); #a_grimling_conqueror
   quest::spawn2(166563,0,0,516,1019,35.5,112.5); #a_grimling_spiritist
   quest::spawn2(166596,0,0,1265.8,2169.8,172,371); #a_grimling_spiritist
   quest::spawn2(166566,5,0,-1212,795.5,9.9,197.6); #Gamtoine_Cursmakk
   quest::spawn2(166521,0,0,1573.9,2270.5,160,208.8); #a_grimling_conqueror
   quest::spawn2(166522,0,0,1525.1,2349.4,163.1,99.8); #a_grimling_conqueror
   quest::spawn2(166523,0,0,1671.1,2462.,158,189.8); #a_grimling_conqueror
   quest::spawn2(166524,0,0,1698.9,2795.8,167.1,212.9); #a_grimling_conqueror
   quest::spawn2(166525,0,0,1697.9,3060.4,159.8,180.1); #a_grimling_conqueror
   quest::spawn2(166526,0,0,2063.2,3211,159.1,170.1); #a_grimling_conqueror
   quest::spawn2(166550,0,0,1975.4,3275.8,159.8,135.4); #a_grimling_overseer
   quest::spawn2(166552,0,0,1949.6,3431.9,150.5,211.8); #a_grimling_overseer
   quest::depop(166576);
    $hollowshade_war_event_grimlings_kill_owlbears == 0;
   quest::depop();
  }
 }
}

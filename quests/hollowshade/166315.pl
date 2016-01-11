##Northen Cave area Wolves kill Owls spawn##

my $hollowshade_war_event_wolves_kill_owlbears = 0;

 
  sub EVENT_SPAWN {
  $hollowshade_war_event_wolves_kill_owlbears = 0;
  $counter = undef;
	 $hollowshade_war_event_wolves_kill_owlbears += 1;	# adds one to spawn variable #
}
sub EVENT_SIGNAL {
	if($signal == 150) { ##signal 150 is from each an_owlbear_defender##
    $counter += 1;
	   if($counter == 5) {
my $a = quest::ChooseRandom(166321,166322,166323,166324);
my $b = quest::ChooseRandom(166325,166326,166327,166328);
my $c = quest::ChooseRandom(166329,166330,166331,166332);
my $d = quest::ChooseRandom(166333,166334,166335,166336);
my $e = quest::ChooseRandom(166337,166338,166339,166340);
my $f = quest::ChooseRandom(166341,166342,166343,166344);
my $g = quest::ChooseRandom(166345,166346,166347,166348);
my $h = quest::ChooseRandom(166349,166350,166351,166352);
my $i = quest::ChooseRandom(166355,166356);
my $j = quest::ChooseRandom(166357,166358);
my $k = quest::ChooseRandom(166359,166360,166361);
my $l = quest::ChooseRandom(166362,166363,166364,166365);
my $m = quest::ChooseRandom(166366,166367,166368,166369);
my $n = quest::ChooseRandom(166370,166371,166372);
my $o = quest::ChooseRandom(166373,166374);
my $p = quest::ChooseRandom(166375,166376);
my $q = quest::ChooseRandom(166377,166378);
my $r = quest::ChooseRandom(166379,166268,166380,166381);
my $s = quest::ChooseRandom(166382,166383);
   quest::depopall(166311);
   quest::depopall(166406);
   quest::signalwith(166405,202,0);
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
   quest::depopall(166482);
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
        quest::spawn2(166390,0,0,1996.1,3623.3,166.6,124.4); #a_sonic_devourer
        quest::spawn2(166391,0,0,1318.9,1109.9,115.5,194.1); #Wolf defender
        quest::spawn2(166392,0,0,398,1942,133.1,25.5); #a_sonic_stalker
        quest::spawn2(166393,0,0,1618.4,2593.6,162.9,153.1); #a_sonic_warwolf
        quest::spawn2(166394,0,0,516,1019,35.5,112.5); #a_sonic_wolf
        quest::spawn2(166395,0,0,1265.8,2169.8,172,371); #a_sonic_wolf
        quest::spawn2(166260,5,0,-1212,795.5,9.9,197.6); #Curfang
        quest::spawn2(166396,0,0,1573.9,2270.5,160,208.8); #a_sonic_warwolf
        quest::spawn2(166397,0,0,1525.1,2349.4,163.1,99.8); #a_sonic_warwolf
        quest::spawn2(166398,0,0,1671.1,2462.,158,189.8); #a_sonic_warwolf
        quest::spawn2(166399,0,0,1698.9,2795.8,167.1,212.9); #a_sonic_warwolf
        quest::spawn2(166400,0,0,1697.9,3060.4,159.8,180.1); #a_sonic_warwolf
        quest::spawn2(166401,0,0,2063.2,3211,159.1,170.1); #a_sonic_warwolf
        quest::spawn2(166402,0,0,1975.4,3275.8,159.8,135.4); #a_sonic_devourer
        quest::spawn2(166404,0,0,1949.6,3431.9,150.5,211.8); #a_sonic_devourer
        quest::spawn2($a,0,0,1735.3,3406.9,,166.4,145.1); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($b,0,0,1793.5,3391.5,,160.8,159); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($c,0,0,1751.2,2885.1,,163.7,199.6); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($d,0,0,1526.7,2495.8,164.7,112); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($e,4,0,1376.4,2167.1,163.3,48.2); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($f,0,0,1827.9,3639.5,158.3,127.1); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($g,0,0,1800.5,3166.7,160.1,222.5); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($h,0,0,1729.7,3499.8,158.7,65); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($i,0,0,1983,3537,158.3,178); #a_sonic_tracker Warpaw Darkpelt
        quest::spawn2($j,498009,0,1443.9,1270,150.5,246.7); #a_sonic_pup
        quest::spawn2($k,498093,0,1498.9,936,53.1,279.5); #a_sonic_stalker a_sonic_ravager a_sonic_devourer
        quest::spawn2($l,9,0,904.7,2337.1,245.3,142.5); #a_sonic_warwolf
        quest::spawn2($m,0,0,1893.1,3077.7,162.3,248.5); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager a_sonic_devourer
        quest::spawn2($n,0,0,1534.5,2806.4,164.1,81.6); #a_sonic_stalker a_sonic_warwolf a_sonic_ravager
        quest::spawn2($o,0,0,2072.1,3100.1,154.5,219.6); #a_sonic_stalker a_sonic_warwolf
        quest::spawn2($p,3,0,1126.5,2150,143.9,63); #a_sonic_tracker a_patrolling_sonic_wolf
        quest::spawn2($q,0,0,1542.4,2979.7,171.5,98); #a_sonic_tracker a_patrolling_sonic_wolf
        quest::spawn2($r,0,0,2002,3027,152.5,243.4); #a_sonic_tracker a_patrolling_sonic_wolf
        quest::spawn2($s,498126,0,1271.8,2131.7,171.6,244.8); #a_sonic_wolf
        quest::dignalwith(166405,202,0);
        quest::depop(166407);
    $hollowshade_war_event_wolves_kill_owlbears == 0;
        quest::depop();
     }
  }
}

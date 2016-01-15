## Northern Cave area under Grimling Control Respawner##
sub EVENT_SIGNAL{
my $a = quest::ChooseRandom(166413,166426,166445,166457);
my $b = quest::ChooseRandom(166414,166427,166446,166458);
my $c = quest::ChooseRandom(166415,166428,166447,166459);
my $d = quest::ChooseRandom(166416,166429,166448,166460);
my $e = quest::ChooseRandom(166417,166430,166449,166461);
my $f = quest::ChooseRandom(166418,166431,166450,166462);
my $g = quest::ChooseRandom(166419,166432,166451,166463);
my $h = quest::ChooseRandom(166420,166433,166452,166464);
my $i = quest::ChooseRandom(166494,166495);#correct for Grimling spawn
my $j = quest::ChooseRandom(166470,166471);
my $k = quest::ChooseRandom(166421,166453,166465);
my $l = quest::ChooseRandom(166491,166434,166454,166489);
my $m = quest::ChooseRandom(166422,166435,166455,166466);
my $n = quest::ChooseRandom(166423,166436,166456);
my $o = quest::ChooseRandom(166594,166243); #correct for Grimling spawn
my $p = quest::ChooseRandom(166474,166477);
my $q = quest::ChooseRandom(166475,166478);
my $r = quest::ChooseRandom(166480,166481);
my $s = quest::ChooseRandom(166584,166479);
if($signal == 400){
   quest::spawn2($a,0,0,1735.3,3406.9,,166.4,145.1); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   } 
  if($signal == 401){
   quest::spawn2($b,0,0,1793.5,3391.5,,160.8,159); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
  if($signal == 402){
   quest::spawn2($c,0,0,1751.2,2885.1,,163.7,199.6); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
  if($signal == 403){
   quest::spawn2($d,0,0,1526.7,2495.8,164.7,112); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
  if($signal == 404){
   quest::spawn2($e,4,0,1376.4,2167.1,163.3,48.2); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
  if($signal == 405){
   quest::spawn2($f,0,0,1827.9,3639.5,158.3,127.1); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
  if($signal == 406){
   quest::spawn2($g,0,0,1800.5,3166.7,160.1,222.5); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
  if($signal == 407){
   quest::spawn2($h,0,0,1729.7,3499.8,158.7,65); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
   if($signal == 408){
   quest::spawn2($i,0,0,1983,3537,158.3,178); #Gniktar Grinwit a_grimling_guard
   }
   if($signal == 409){
   quest::spawn2($j,498009,0,1443.9,1270,150.5,246.7); #an_owlbear_cub
   }
   if($signal == 410){
   quest::spawn2($k,498093,0,1498.9,936,53.1,279.5); #an_owlbear_ravager an_owlbear_razorclaw an_owlbear_grappler
   }
   if($signal == 411){
   quest::spawn2($l,9,0,904.7,2337.1,245.3,142.5); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
   if($signal == 412){
   quest::spawn2($m,0,0,1893.1,3077.7,162.3,248.5); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw an_owlbear_grappler
   }
   if($signal == 413){
   quest::spawn2($n,0,0,1534.5,2806.4,164.1,81.6); #an_owlbear_ravager an_owlbear_razorbeak an_owlbear_razorclaw
   }
   if($signal == 414){
   quest::spawn2($o,0,0,2072.1,3100.1,154.5,219.6); #a_grimling_guard Gleeknot Gnitrat
   }
   if($signal == 415){
   quest::spawn2($p,3,0,1126.5,2150,143.9,63); #an_owlbear_spurclaw a_patrolling_owlbear
   }
   if($signal == 416){
    quest::spawn2($q,,0,0,1542.4,2979.7,171.5,98); #an_owlbear_spurclaw a_patrolling_owlbear
   }
   if($signal == 417){
   quest::spawn2($r,0,0,2002,3027,152.5,243.4); #an_owlbear_spurclaw a_patrolling_owlbear
   }
   if($signal == 418){
   quest::spawn2($s,498126,0,1271.8,2131.7,171.6,244.8); #an_owlbear_gatherer
   }
   if($signal == 419){    
   quest::spawn2(166585,0,0,1190,2159.2,170.6,185.6); #an_owlbear_defender
   }
   if($signal == 420){
   quest::spawn2(166586,0,0,1187.5,2177,173.8,191.5); #an_owlbear_defender
   }
   if($signal == 421){
   quest::spawn2(166587,0,0,1186.9,2198.8,178.1,189.8); #an_owlbear_defender
   }
   if($signal == 422){
   quest::spawn2(166588,0,0,1195,2139.7,169.7,191.6); #an_owlbear_defender
   }
   if($signal == 423){
   quest::spawn2(166487,0,0,1194.6,2117.5,168,194.8); #an_owlbear_defender
   }
   if($signal == 424){
   quest::spawn2(166467,0,0,1996.1,3623.3,166.6,124.4); #an_owlbear_grappler
   }
   if($signal == 425){
   quest::spawn2(166589,0,0,1318.9,1109.9,115.5,194.1); #an_owlbear_razorbeak
   }
   if($signal == 426){
   quest::spawn2(166425,0,0,398,1942,133.1,25.5); #an_owlbear_ravager
   }
   if($signal == 427){
   quest::spawn2(166438,0,0,1618.4,2593.6,162.9,153.1); #an_owlbear_razorbeak
   }
   if($signal == 428){
   quest::spawn2(166492,0,0,516,1019,35.5,112.5); #an_owlbear_hunter
   }
   if($signal == 429){
   quest::spawn2(166493,0,0,1265.8,2169.8,172,371); #an_owlbear_hunter
   }
   if($signal == 430){
   quest::spawn2(166494,5,0,-1212,795.5,9.9,197.6); #Skrietat_Chet
   }
   if($signal == 431){
   quest::spawn2(166439,0,0,1573.9,2270.5,160,208.8); #an_owlbear_razorbeak
   }
   if($signal == 432){
   quest::spawn2(166440,0,0,1525.1,2349.4,163.1,99.8); #an_owlbear_razorbeak
   }
   if($signal == 433){
   quest::spawn2(166441,0,0,1671.1,2462.,158,189.8); #an_owlbear_razorbeak
   }
   if($signal == 434){
   quest::spawn2(166442,0,0,1698.9,2795.8,167.1,212.9); #an_owlbear_razorbeak
   }
   if($signal == 435){
   quest::spawn2(166443,0,0,1697.9,3060.4,159.8,180.1); #an_owlbear_razorbeak
   }
   if($signal == 436){
   quest::spawn2(166444,0,0,2063.2,3211,159.1,170.1); #an_owlbear_razorbeak
   }
   if($signal == 437){
   quest::spawn2(166590,0,0,1975.4,3275.8,159.8,135.4); #an_owlbear_grappler
   }
   if($signal == 438){
   quest::spawn2(166468,0,0,1975.4,3275.8,159.8,135.4); #an_owlbear_grappler
   }
   if($signal == 439){
   quest::spawn2(166469,0,0,1949.6,3431.9,150.5,211.8); #an_owlbear_grappler
   }
   if($signal == 440){
   quest::spawn2(166412,498125,0,1949.6,3431.9,150.5,211.8); #Prince_Skriatat
   }
}

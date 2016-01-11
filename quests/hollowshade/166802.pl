sub EVENT_SPAWN{
   quest::depopall(166668);
   quest::depop(166233);
   quest::depop(166601);
   quest::depop(166600);
   quest::depop(166509);
   quest::depop(166734);
   quest::depop(166496);
   quest::depop(166735);
   quest::depop(166510);
   quest::depop(166736);
   quest::depop(166497);
   quest::depop(166737);
   quest::depop(166738);
   quest::depop(166739);
   quest::depop(166740);
   quest::depop(166512);
   quest::depop(166531);
   quest::depop(166743);
   quest::depop(166744);
   quest::depop(166745);
   quest::depop(166746);
   quest::depop(166500);
   quest::depop(166747);
   quest::depop(166534);
   quest::depop(166748);
   quest::depop(166749);
   quest::depop(166750);
   quest::depop(166751);
   quest::depop(166752);
   quest::depop(166753);
   quest::depop(166754);
   quest::depop(166728);
   quest::depop(166729);
   quest::depop(166755);
   quest::depop(166730);
   quest::depop(166731);
   quest::depop(166732);
   quest::depop(166756);
   quest::depop(166757);
   quest::depop(166758);
   quest::depop(166733);
   quest::depop(166759);
   quest::depop(166760);
   quest::depop(166761);
   quest::depop(166762);
   quest::depop(166763);
   quest::depop(166764);
   quest::depop(166765);
   quest::depop(166767);
   quest::depop(166521);
   quest::depop(166768);
   quest::depop(166769);
   quest::depop(166720);
   quest::depop(166791);
   quest::depop(166670);
   quest::depop(166671);
   quest::depop(166672);
   quest::depop(166673);
   quest::depop(166674);
   quest::depop(166675);
   quest::depop(166676);
   quest::depop(166677);
   quest::depop(166678);
   quest::depop(166679);
   quest::depop(166680);
   quest::depop(166681);
   quest::depop(166682);
   quest::depop(166683);
   quest::depop(166684);
   quest::depop(166685);
   quest::depop(166686);
   quest::depop(166687);
   quest::depop(166688);
   quest::depop(166689);
   quest::depop(166690);
   quest::depop(166691);
   quest::depop(166692);
   quest::depop(166693);
   quest::depop(166694);
   quest::depop(166695);
   quest::depop(166696);
   quest::depop(166697);
   quest::depop(166698);
   quest::depop(166699);
   quest::depop(166700);
   quest::depop(166701);
   quest::depop(166702);
   quest::depop(166703);
   quest::depop(166704);
   quest::depop(166705);
   quest::depop(166706);
   quest::depop(166707);
   quest::depop(166708);
   quest::depop(166709);
   quest::depop(166710);
   quest::depop(166711);
   quest::depop(166712);
   quest::depop(166713);
   quest::depop(166714);
   quest::depop(166715);
   quest::depop(166716);
   quest::depop(166717);
   quest::depop(166718);
   quest::depop(166602);
   quest::depop(166603);
   quest::depop(166604);
   quest::depop(166655);
   quest::depop(166656);
   quest::depop(166657);
   quest::depop(166658);
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
  }
sub EVENT_SIGNAL{  
if($signal == 11){
my $t = quest::ChooseRandom(166602,166603,166604);
my $u = quest::ChooseRandom(166655,166656,166657,166658);
my $v = quest::ChooseRandom(166605,166606,166607,166608);
my $w = quest::ChooseRandom(166609,166610,166611);
my $x = quest::ChooseRandom(166612,166613,166614);
my $y = quest::ChooseRandom(166615,166616,166617,166618);
my $z = quest::ChooseRandom(166619,166620,166621,166622);
my $aa = quest::ChooseRandom(166623,166624,126625,126626);
my $ab = quest::ChooseRandom(166627,166628,166629,166630);
my $ac = quest::ChooseRandom(166631,166632,166633);
my $ad = quest::ChooseRandom(166634,166635,166636);
my $ae = quest::ChooseRandom(166637,166638,166639);
my $af = quest::ChooseRandom(166640,166641,166642);
my $ag = quest::ChooseRandom(166643,166644,166645);
my $ah = quest::ChooseRandom(166646,166647,166648);
   quest::spawn2($t,0,0,-2969.5,466.9,55.6,24.6); #Ghowlik The_Fabled_Ghowlik a_sonic_packleader
   quest::spawn2($u,0,0,-2887.4,627.4,71.1,132.4); #a_sonic_devourer a_sonic_hunter a_sonic_ravager a_sonic_stalker
   quest::spawn2($v,0,0,-2997.8,516.2,54,35); #a_sonic_devourer a_sonic_hunter a_sonic_ravager a_sonic_stalker
   quest::spawn2($w,0,0,-3002.5,573.7,52.7,63.5); #a_sonic_tracker a_sonic_devourer a_sonic_warwolf
   quest::spawn2($x,0,0,-3113.2,618.4,64.2,99.1); #a_sonic_ravager a_sonic_hunter a_sonic_devourer
   quest::spawn2($y,0,0,-2991.5,666.2,62,109); #a_sonic_devourer a_sonic_hunter a_sonic_ravager a_sonic_stalker
   quest::spawn2($z,0,0,-2942.5,670.6,64.7,129.9); #a_sonic_tracker a_sonic_devourer a_sonic_warwolf a_sonic_ravager
   quest::spawn2($aa,0,0,-2906.6,663.3,71.5,153.9); #a_sonic_tracker a_sonic_warwolf a_sonic_devourer a_sonic_hunter
   quest::spawn2($ab,0,0,-2867.1,582.8,69.9,159); #a_sonic_stalker a_sonic_ravager a_sonic_hunter a_sonic_warwolf
   quest::spawn2($ac,0,0,-2832.2,572.7,70.1,89.4); #a_sonic_ravager a_sonic_stalker a_sonic_warwolf
   quest::spawn2($ad,0,0,-2929.9,409,71.2,5.1); #a_sonic_hunter a_sonic_ravager a_sonic_stalker  
   quest::spawn2($ae,9,0,-2887.4,477.7,71,227.1); #a_sonic_tracker a_sonic_devourer a_sonic_warwolf
   quest::spawn2($af,0,0,-2845.7,507.9,70.4,20.9); #a_sonic_ravager a_sonic_hunter a_sonic_devourer
   quest::spawn2($ag,0,0,-2932.2,525,55.8,62.2); #a_sonic_hunter a_sonic_ravager a_sonic_stalker  
   quest::spawn2($ah,0,0,-2931.4,584.7,54.5,77.4); #a_sonic_tracker a_sonic_devourer a_sonic_warwolf
   quest::signalwith(166663,708,0);
   quest::depop();
   }
}

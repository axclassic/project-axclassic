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
my $bs = quest::ChooseRandom(166720,166791,166670);
my $bt = quest::ChooseRandom(166671,166672,166673,166674);
my $bu = quest::ChooseRandom(166675,166676,166677,166678);
my $bv = quest::ChooseRandom(166679,166680,166681);
my $bw = quest::ChooseRandom(166682,166683,166684);
my $bx = quest::ChooseRandom(166685,166686,166687,166688);
my $by = quest::ChooseRandom(166689,166690,166691,166692);
my $bz = quest::ChooseRandom(166693,166694,126695,126696);
my $ca = quest::ChooseRandom(166697,166698,166699,166700);
my $cb = quest::ChooseRandom(166701,166702,166703);
my $cc = quest::ChooseRandom(166704,166705,166706);
my $cd = quest::ChooseRandom(166707,166708,166709);
my $ce = quest::ChooseRandom(166710,166711,166712);
my $cf = quest::ChooseRandom(166713,166714,166715);
my $cg = quest::ChooseRandom(166716,166717,166718);     
   quest::spawn2($bs,0,0,-2969.5,466.9,55.6,24.6); #an owlbear fleshrender Skriat Chee an owlbear fleshrender
   quest::spawn2($bt,0,0,-2887.4,627.4,71.1,132.4); #an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::spawn2($bu,0,0,-2997.8,516.2,54,35); #an owlbear ravager an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($bv,0,0,-3002.5,573.7,52.7,63.5); #an owlbear bonegrinder an owlbear grappler an owlbear ravager
   quest::spawn2($bw,0,0,-3113.2,618.4,64.2,99.1); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($bx,0,0,-2991.5,666.2,62,109); #an owlbear fleshrender an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::spawn2($by,0,0,-2942.5,670.6,64.7,129.9); #an owlbear razorbeak an owlbear razorclaw an owlbear bonegrinder an owlbear grappler
   quest::spawn2($bz,0,0,-2906.6,663.3,71.5,153.9); #an owlbear fleshrender an owlbear grappler an owlbear ravager an owlbear fleshrender
   quest::spawn2($ca,0,0,-2867.1,582.8,69.9,159); #an owlbear grappler an owlbear ravager an owlbear fleshrender an owlbear fleshrender
   quest::spawn2($cb,0,0,-2832.2,572.7,70.1,89.4); #an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::spawn2($cc,0,0,-2929.9,409,71.2,5.1); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($cd,9,0,-2887.4,477.7,71,227.1); #an owlbear bonegrinder an owlbear grappler an owlbear ravager
   quest::spawn2($ce,0,0,-2845.7,507.9,70.4,20.9); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($cf,0,0,-2932.2,525,55.8,62.2); #an owlbear razorbeak an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($cg,0,0,-2931.4,584.7,54.5,77.4); #an owlbear bonegrinder an owlbear grappler an owlbear hunter
   quest::signalwith(166663,707,0);
   quest::depop();
   }
 }

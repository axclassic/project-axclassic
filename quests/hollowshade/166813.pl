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
my $ch = quest::ChooseRandom(166233,166601,166600);
my $ci = quest::ChooseRandom(166509,166734,166496,166735);
my $cj = quest::ChooseRandom(166510,166736,166497,166737);
my $ck = quest::ChooseRandom(166738,166739,166740);
my $cl = quest::ChooseRandom(166512,166531,166743);
my $cm = quest::ChooseRandom(166744,166745,166746,166500);
my $cn = quest::ChooseRandom(166747,166534,166748,166749);
my $co = quest::ChooseRandom(166750,166751,126752,126753);
my $cp = quest::ChooseRandom(166754,166728,166729,166755);
my $cq = quest::ChooseRandom(166730,166731,166732);
my $cr = quest::ChooseRandom(166756,166757,166758);
my $cs = quest::ChooseRandom(166733,166759,166760);
my $ct = quest::ChooseRandom(166761,166762,166763);
my $cu = quest::ChooseRandom(166764,166765,166767);
my $cv = quest::ChooseRandom(166521,166768,166769);
   quest::spawn2($ch,0,0,-2969.5,466.9,55.6,24.6); #grimling tribal leader Grurn No Eyes Fabled Grurn No Eyes
   quest::spawn2($ci,0,0,-2887.4,627.4,71.1,132.4); #a grimling conqueror a grimling spiritist a grimling thief a grimling soldier
   quest::spawn2($cj,0,0,-2997.8,516.2,54,35); #a grimling conqueror a grimling soldier a grimling thief a grimling overseeer
   quest::spawn2($ck,0,0,-3002.5,573.7,52.7,63.5); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($cl,0,0,-3113.2,618.4,64.2,99.1); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($cm,0,0,-2991.5,666.2,62,109); #a grimling conqueror a grimling soldier a grimling conqueror a grimling thief
   quest::spawn2($cn,0,0,-2942.5,670.6,64.7,129.9); #a grimling conqueror a grimling soldier a grimling spiritist a grimling thief
   quest::spawn2($co,0,0,-2906.6,663.3,71.5,153.9); #a grimling conqueror a grimling soldier a grimling conqueror a grimling thief
   quest::spawn2($cp,0,0,-2867.1,582.8,69.9,159); #a grimling conqueror a grimling soldier a grimling spiritist a grimling thief
   quest::spawn2($cq,0,0,-2832.2,572.7,70.1,89.4); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($cr,0,0,-2929.9,409,71.2,5.1); #a grimling conqueror a grimling overseeer a grimling thief
   quest::spawn2($cs,9,0,-2887.4,477.7,71,227.1); #a grimling conqueror a grimling soldier a grimling thief
   quest::spawn2($ct,0,0,-2845.7,507.9,70.4,20.9); #a grimling conqueror a grimling overseeer a grimling overseeer
   quest::spawn2($cu,0,0,-2932.2,525,55.8,62.2); #a grimling overseeer a grimling conqueror a grimling thief
   quest::spawn2($cv,0,0,-2931.4,584.7,54.5,77.4); #a grimling conqueror a grimling overseeer a grimling thief
   quest::signalwith(166663,706,0);
   quest::depop();
   }
  }

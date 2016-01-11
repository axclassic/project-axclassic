##South Village area Owls kill Grimlings spawn##

my $owlbears_kill_grimlings_south_village = 0;

 
  sub EVENT_SPAWN {
  $owlbears_kill_grimlings_south_village = 0;
  $counter = undef;
  $owlbears_kill_grimlings_south_village += 1;	# adds one to spawn variable #
  }
sub EVENT_SIGNAL {
    
	if($signal == 550) { ##signal 550 is from each grimling_defender##
    $counter += 1;
	   if($counter == 5) {
my $a = quest::ChooseRandom();
my $b = quest::ChooseRandom();
my $c = quest::ChooseRandom();
my $d = quest::ChooseRandom();
my $e = quest::ChooseRandom();
my $f = quest::ChooseRandom();
my $g = quest::ChooseRandom();
my $h = quest::ChooseRandom();
my $i = quest::ChooseRandom();
my $j = quest::ChooseRandom();
my $k = quest::ChooseRandom();
my $l = quest::ChooseRandom();
my $m = quest::ChooseRandom();
my $n = quest::ChooseRandom();
my $o = quest::ChooseRandom();
   quest::signalwith(166821,502,0);
   quest::depop(166177);
   quest::depop(166777);
   quest::depop(166829);
   quest::depop(166830);
   quest::depop(166831);
   quest::depop(166832);
   quest::depop(166833);
   quest::depop(166834);
   quest::depop(166835);
   quest::depop(166836);
   quest::depop(166837);
   quest::depop(166838);
   quest::depop(166839);
   quest::depop(166840);
   quest::depop(166841);
   quest::depop(166842);
   quest::depop(166843);
   quest::depop(166844);
   quest::depop(166845);
   quest::depop(166846);
   quest::depop(166847);
   quest::depop(166848);
   quest::depop(166849);
   quest::depop(166850);
   quest::depop(166851);
   quest::depop(166852);
   quest::depop(166853);
   quest::depop(166854);
   quest::depop(166855);
   quest::depop(166856);
   quest::depop(166857);
   quest::depop(166858);
   quest::depop(166859);
   quest::depop(166860);
   quest::depop(166861);
   quest::depop(166862);
   quest::depop(166863);
   quest::depop(166864);
   quest::depop(166865);
   quest::depop(166170);
   quest::depop(166210);
   quest::depop(166209);
my $ei = quest::ChooseRandom(166908,166811,166909);
my $ej = quest::ChooseRandom(166910,166911);
my $ek = quest::ChooseRandom(166912,166913);
my $el = quest::ChooseRandom(166914,166915);
my $em = quest::ChooseRandom(166916,166917);
my $en = quest::ChooseRandom(166918,166919);
my $eo = quest::ChooseRandom(166920,166921);   
my $ep = quest::ChooseRandom(166922,166923);
my $eq = quest::ChooseRandom(166924,166925);
my $er = quest::ChooseRandom(166926,166927);
my $es = quest::ChooseRandom(166928,166929);
my $et = quest::ChooseRandom(166930,166931);
my $eu = quest::ChooseRandom(166932,166933);
my $ev = quest::ChooseRandom(166934,166935);
my $ew = quest::ChooseRandom(166936,166937);
my $ex = quest::ChooseRandom(166938,166939);
my $ey = quest::ChooseRandom(166940,166941);
my $ez = quest::ChooseRandom(166942,166943);
my $fa = quest::ChooseRandom(166944,166945);
   quest::spawn2($ei,0,0,-620.4,-2810.5,85.5,255.1); #an owlbear razorbeak an owlbear screechmaw an owlbear spurclaw
   quest::spawn2($ej,0,0,-493.6,-2737.4,54.8,195.9); #an owlbear bonegrinder an owlbear fleshrenderer
   quest::spawn2($ek,0,0,-506.8,-2754.4,46.1,196.9); #an owlbear hunter an owlbear ravager
   quest::spawn2($el,0,0,-505.1,-2719.4,37.7,213.5); #an owlbear razorbeak an owlbear razorclaw
   quest::spawn2($em,0,0,-668.2,-2681.7,34,212.1); #an owlbear spurclaw an owlbear bonegrinder
   quest::spawn2($en,0,0,-675,-2663.7,17.7,205.8); #an owlbear fleshrenderer an owlbear hunter
   quest::spawn2($eo,0,0,-685.1,-2694.8,22.7,214.9); #an owlbear ravager an owlbear razorbeak
   quest::spawn2($ep,0,0,-590.1,-2659.5,26.1,205.1); #an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($eq,0,0,-604.4,-2671.7,24.4,208.6); #an owlbear bonegrinder an owlbear fleshrenderer
   quest::spawn2($er,0,0,-591,-2642.5,14.8,211.2); #an owlbear hunter an owlbear ravager
   quest::spawn2($es,0,0,-579.2,-2616.6,10.7,183.9); #an owlbear razorbeak an owlbear razorclaw
   quest::spawn2($et,0,0,-569.2,-2601.2,20.7,185.9); #an owlbear spurclaw an owlbear bonegrinder
   quest::spawn2($eu,0,0,-579.3,-2584.3,9.2,190.5); #an owlbear fleshrenderer an owlbear hunter
   quest::spawn2($ev,0,0,-537,-2581,13.8,211.6); #an owlbear ravager an owlbear razorbeak
   quest::spawn2($ew,0,0,-521.1,-2566.1,21.3,194.1); #an owlbear razorclaw an owlbear spurclaw
   quest::spawn2($ex,0,0,-533.1,-2548.8,6.4,187.9); #an owlbear bonegrinder an owlbear fleshrenderer
   quest::spawn2($ey,0,0,-444.8,-2514.3,28,203.9); #an owlbear hunter an owlbear ravager
   quest::spawn2($ez,0,0,-448.2,-2497.1,20.7,199.5); #an owlbear razorbeak an owlbear razorclaw
   quest::spawn2($fa,0,0,-458.8,-2528,15.8,198.5); #an owlbear spurclaw an owlbear bonegrinder
   quest::spawn2(166948,0,0,-620.8,-2824.6,70.3,2.4); #an owlbear razorclaw
   quest::spawn2(166949,0,0,-626.6,-2842.3,82.8,253.4); #an owlbear razorclaw
   quest::spawn2(166946,0,0,-631.3,-2801.4,68.1,254.5); #an owlbear razorbeak
   quest::spawn2(166947,0,0,-610.7,-2801.4,68.1,254.5); #an owlbear razorbeak
   quest::depop(166823); 
    $owlbears_kill_grimlings_south_village == 0;
   quest::depop();
  }
 }
}


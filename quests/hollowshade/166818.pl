##Owlbears control South Village Player activated war##
sub EVENT_SPAWN{
   quest::depop(166870);
   quest::depop(166784);
   quest::depop(166871);
   quest::depop(166872);
   quest::depop(166873);
   quest::depop(166953);
   quest::depop(166875);
   quest::depop(166876);
   quest::depop(166877);
   quest::depop(166878);
   quest::depop(166879);
   quest::depop(166880);
   quest::depop(166881);
   quest::depop(166882);
   quest::depop(166883);
   quest::depop(166884);
   quest::depop(166885);
   quest::depop(166886);
   quest::depop(166887);
   quest::depop(166888);
   quest::depop(166889);
   quest::depop(166890);
   quest::depop(166891);
   quest::depop(166892);
   quest::depop(166893);
   quest::depop(166894);
   quest::depop(166895);
   quest::depop(166896);
   quest::depop(166897);
   quest::depop(166898);
   quest::depop(166899);
   quest::depop(166900);
   quest::depop(166901);
   quest::depop(166902);
   quest::depop(166903);
   quest::depop(166904);
   quest::depop(166905);
   quest::depop(166906);
   quest::depop(166907);
   quest::depop(166147);
   quest::depop(166156);
  quest::depop(166908);
  quest::depop(166811);
  quest::depop(166909);
  quest::depop(166910);
  quest::depop(166911);
  quest::depop(166912);
  quest::depop(166913);
  quest::depop(166914);
  quest::depop(166915);
  quest::depop(166916);
  quest::depop(166917);
  quest::depop(166918);
  quest::depop(166919);
  quest::depop(166920);
  quest::depop(166921);
  quest::depop(166922);
  quest::depop(166923);
  quest::depop(166924);
  quest::depop(166925);
  quest::depop(166926);
  quest::depop(166927);
  quest::depop(166928);
  quest::depop(166929);
  quest::depop(166930);
  quest::depop(166931);
  quest::depop(166932);
  quest::depop(166933);
  quest::depop(166934);
  quest::depop(166935);
  quest::depop(166936);
  quest::depop(166937);
  quest::depop(166938);
  quest::depop(166939);
  quest::depop(166940);
  quest::depop(166941);
  quest::depop(166942);
  quest::depop(166943);
  quest::depop(166944);
  quest::depop(166945);
  quest::depop(166946);
  quest::depop(166947);
  quest::depop(166948);
  quest::depop(166949);
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
   quest::depop(166175);
   quest::depop(166170);
   quest::depop(166210);
   quest::depop(166209);
  }
sub EVENT_SIGNAL{  
if($signal == 11){
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
   quest::spawn2($ei,0,0,-620.1,-620.4,-2810.5,85.5,255.1); #an owlbear razorbeak an owlbear screechmaw an owlbear spurclaw
   quest::spawn2($ej,0,0,-493.6,-2737.4,54.8,195.9); #an owlbear bonegrinder an owlbear fleshrenderer
   quest::spawn2($ek,0,0,-506.8,-2754.4,46.1,196.9); #an owlbear hunter an owlbear ravager
   quest::spawn2($el,0,0,-505.1,-2719.4,37.7,213.5); #an owlbear razorbeak an owlbear razorclaw
   quest::spawn2($em,0,0,-668.2,-2681.7,34,212.1); #an owlbear spurclaw an owlbear bonegrinder
   quest::spawn2($en,0,0,-675,-2663.7,17.7,205.8); #an owlbear fleshrenderer an owlbear hunter
   quest::spawn2($eo,0,0,-685.1,-2694.8,22.7,214.9); #an owlbear ravager an owlbear razorbeak
   quest::spawn2($ep,0,0,-590.1,-2659.5,26.1,205.1); #an owlbear razorclaw 166922 an owlbear spurclaw
   quest::spawn2($eq,0,0,-604.4,-2671.7,24.4,208.6); #an owlbear bonegrinder an owlbear fleshrenderer 166925
   quest::spawn2($er,0,0,-591,-2642.5,14.8,211.2); #an owlbear hunter an owlbear ravager 166927
   quest::spawn2($es,0,0,-579.2,-2616.6,10.7,183.9); #an owlbear razorbeak 166928 an owlbear razorclaw
   quest::spawn2($et,0,0,-569.2,-2601.2,20.7,185.9); #an owlbear spurclaw 166930 an owlbear bonegrinder
   quest::spawn2($eu,0,0,-579.3,-2584.3,9.2,190.5); #an owlbear fleshrenderer 166932 an owlbear hunter
   quest::spawn2($ev,0,0,-537,-2581,13.8,211.6); #an owlbear ravager 166934 an owlbear razorbeak
   quest::spawn2($ew,0,0,-521.1,-2566.1,21.3,194.1); #an owlbear razorclaw 166936 an owlbear spurclaw
   quest::spawn2($ex,0,0,-533.1,-2548.8,6.4,187.9); #an owlbear bonegrinder 166938 an owlbear fleshrenderer
   quest::spawn2($ey,0,0,-444.8,-2514.3,28,203.9); #an owlbear hunter an owlbear ravager 166941
   quest::spawn2($ez,0,0,-448.2,-2497.1,20.7,199.5); #an owlbear razorbeak 166942 an owlbear razorclaw
   quest::spawn2($fa,0,0,-458.8,-2528,15.8,198.5); #an owlbear spurclaw 166944 an owlbear bonegrinder
   quest::spawn2(166948,0,0,-620.8,-2824.6,70.3,2.4); #an owlbear razorclaw
   quest::spawn2(166949,0,0,-626.6,-2842.3,82.8,253.4); #an owlbear razorclaw
   quest::spawn2(166946,0,0,-631.3,-2801.4,68.1,254.5); #an owlbear razorbeak
   quest::spawn2(166947,0,0,-610.7,-2801.4,68.1,254.5); #an owlbear razorbeak
   quest::signalwith(166821,507,0);
   quest::depop();
   }
}


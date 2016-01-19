##Grimlings control South Village Player activated war##
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
my $cw = quest::ChooseRandom(166177,166777,166829);
my $cx = quest::ChooseRandom(166830,166831);
my $cy = quest::ChooseRandom(166832,166833);
my $cz = quest::ChooseRandom(166834,166835);
my $da = quest::ChooseRandom(166836,166837);
my $db = quest::ChooseRandom(166838,166839);
my $dc = quest::ChooseRandom(166840,166841);
my $dd = quest::ChooseRandom(166842,166843);
my $de = quest::ChooseRandom(166844,166845);
my $df = quest::ChooseRandom(166846,166847);
my $dg = quest::ChooseRandom(166848,166849);
my $dh = quest::ChooseRandom(166850,166851);
my $di = quest::ChooseRandom(166852,166853);
my $dj = quest::ChooseRandom(166854,166855);
my $dk = quest::ChooseRandom(166856,166857);
my $dl = quest::ChooseRandom(166858,166859);
my $dm = quest::ChooseRandom(166860,166861);
my $dn = quest::ChooseRandom(166862,166863);
my $do = quest::ChooseRandom(166864,166865);
   quest::spawn2($cw,0,0,-620.4,-2810.5,85.5,255.1); #a grimling spiritist a grimling chieftan a grimling priest
   quest::spawn2($cx,0,0,-493.6,-2737.4,54.8,195.9); #a grimling thief a grimling soldier
   quest::spawn2($cy,0,0,-506.8,-2754.4,46.1,196.9); #a grimling spiritist a grimling mystic
   quest::spawn2($cz,0,0,-505.1,-2719.4,37.7,213.5); #a grimling overseeer a grimling conqueror
   quest::spawn2($da,0,0,-668.2,-2681.7,34,212.1); #a grimling recruit a grimling soldier
   quest::spawn2($db,0,0,-675,-2663.7,17.7,205.8); #a grimling spiritist a grimling mystic
   quest::spawn2($dc,0,0,-685.1,-2694.8,22.7,214.9); #a grimling conqueror a grimling soldierr
   quest::spawn2($dd,0,0,-590.1,-2659.5,26.1,205.1); #a grimling overseeer a grimling recruit
   quest::spawn2($de,0,0,-604.4,-2671.7,24.4,208.6); #a grimling spiritist a grimling mystic 
   quest::spawn2($df,0,0,-591,-2642.5,14.8,211.2); #a grimling overseeer a grimling conqueror
   quest::spawn2($dg,0,0,-579.2,-2616.6,10.7,183.9); #a grimling recruit a grimling soldier
   quest::spawn2($dh,0,0,-569.2,-2601.2,20.7,185.9); #a grimling  spiritist a grimling mystic
   quest::spawn2($di,0,0,-579.3,-2584.3,9.2,190.5); #a grimling overseeer a grimling conqueror 
   quest::spawn2($dj,0,0,-537,-2581,13.8,211.6); #a grimling thief a grimling soldier 
   quest::spawn2($dk,0,0,-521.1,-2566.1,21.3,194.1); #a grimling soldier a grimling recruit
   quest::spawn2($dl,0,0,-533.1,-2548.8,6.4,187.9); #a grimling recruit a grimling soldier 
   quest::spawn2($dm,0,0,-444.8,-2514.3,28,203.9); #a grimling thief a grimling soldier 
   quest::spawn2($dn,0,0,-448.2,-2497.1,20.7,199.5); #a grimling  spiritist a grimling mystic
   quest::spawn2($do,0,0,-458.8,-2528,15.8,198.5); #a grimling overseeer a grimling conqueror 
   quest::spawn2(166175,0,0,-620.8,-2824.6,70.3,2.4); #a grimling spiritist
   quest::spawn2(166170,0,0,-626.6,-2842.3,82.8,253.4); #a grimling spiritist
   quest::spawn2(166210,0,0,-631.3,-2801.4,68.1,254.5); #a grimling bodyguard
   quest::spawn2(166209,0,0,-610.7,-2801.4,68.1,254.5); #a grimling bodyguard
   quest::signalwith(166821,506,0);
   quest::depop();
   }
}

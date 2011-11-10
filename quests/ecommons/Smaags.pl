##########################smaags banded armorer##########################
####Developed by Romell
####Date 04.14.09

sub EVENT_SPAWN

{
my $x;
my $y;
my $z;
my $h;

$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$h = $npc->GetHeading();


 quest::set_proximity( $x-40,$x+40,$y-40,$y+40,$z-40,$z+40);
 
} 

sub EVENT_ENTER
{
  quest::shout("Blacksmith for hire! can make Banded armor of all sizes!. Have mats for sale!");

}

sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Hiya $name, I can smith you Banded armor for 5pp - 10PP + items. I also have materials for sale. Interested in [small], [medium] or [large]? I can also forge [sheet metal] from ore.");
}
elsif ($text =~/small/i)
#small banded
{
quest::say ("Give me 2x sheet metal, 1x small belt sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3071); #small banded belt
quest::say ("Give me 1x sheet metal, 1x small boot mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3076); #small banded boots
quest::say ("Give me 1x sheet metal, 1x small bracer sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3073); #small banded bracer
quest::say ("Give me 2x sheet metal, 1x small cloak sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3070); #small banded cloak
quest::say ("Give me 2x sheet metal, 1x small gauntlet mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3074); #small banded gauntlets
quest::say ("Give me 2x sheet metal, 1x small helm mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3065); #small banded helm
quest::say ("Give me 1x sheet metal, 1x small gorget mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3067); #small banded gorget
quest::say ("Give me 2x sheet metal, 1x small leggings sectional mold, 1x water flask and 10pp and I will make you a...");
quest::itemlink(3075); #small banded leggings
quest::say ("Give me 2x sheet metal, 1x small mail sectional mold, 1x water flask and 10pp and I will make you a...");
quest::itemlink(3068); #small banded mail
quest::say ("Give me 2x sheet metal, 1x small mantle sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3069); #small banded mantle
quest::say ("Give me 2x sheet metal, 1x small mask mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3066); #small banded mask
quest::say ("Give me 2x sheet metal, 1x small sleeves sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3072); #small banded sleeves

 }
elsif ($text =~/medium/i)
{

#Medium
quest::say ("Give me 2x sheet metal, 1x belt sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3059); #banded belt
quest::say ("Give me 1x sheet metal, 1x boot mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3064); #banded boots
quest::say ("Give me 1x sheet metal, 1x bracer sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3061); #banded bracer
quest::say ("Give me 2x sheet metal, 1x cloak sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3058); #banded cloak
quest::say ("Give me 2x sheet metal, 1x gauntlet mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3062); #banded gauntlets
quest::say ("Give me 2x sheet metal, 1x helm mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3053); #banded helm
quest::say ("Give me 1x sheet metal, 1x gorget mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3055); #banded gorget
quest::say ("Give me 2x sheet metal, 1x leggings sectional mold, 1x water flask and 10pp and I will make you a...");
quest::itemlink(3063); #banded leggings
quest::say ("Give me 2x sheet metal, 1x mail sectional mold, 1x water flask and 10pp and I will make you a...");
quest::itemlink(3056); #banded mail
quest::say ("Give me 2x sheet metal, 1x mantle sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3057); #banded mantle
quest::say ("Give me 2x sheet metal, 1x mask mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3054); #banded mask
quest::say ("Give me 2x sheet metal, 1x sleeves sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3060); #banded sleeves

}
elsif ($text =~/large/i)
{
#large banded
quest::say ("Give me 2x sheet metal, 1x large belt sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3083); #large banded belt
quest::say ("Give me 1x sheet metal, 1x large boot mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3088); #large banded boots
quest::say ("Give me 1x sheet metal, 1x large bracer sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3085); #large banded bracer
quest::say ("Give me 2x sheet metal, 1x large cloak sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3082); #large banded cloak
quest::say ("Give me 2x sheet metal, 1x large gauntlet mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3089); #large banded gauntlets
quest::say ("Give me 2x sheet metal, 1x large helm mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3077); #large banded helm
quest::say ("Give me 1x sheet metal, 1x large gorget mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3079); #large banded gorget
quest::say ("Give me 2x sheet metal, 1x large leggings sectional mold, 1x water flask and 10pp and I will make you a...");
quest::itemlink(3087); #large banded leggings
quest::say ("Give me 2x sheet metal, 1x large mail sectional mold, 1x water flask and 10pp and I will make you a...");
quest::itemlink(3080); #large banded mail
quest::say ("Give me 2x sheet metal, 1x large mantle sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3081); #large banded mantle
quest::say ("Give me 2x sheet metal, 1x large mask mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3078); #large banded mask
quest::say ("Give me 2x sheet metal, 1x large sleeves sectional mold, 1x water flask and 5pp and I will make you a...");
quest::itemlink(3084); #large banded sleeves

}
elsif ($text =~/sheet metal/i)
{
quest::say ("Give me 2x small brick of ore, 1x water flask and 1pp. I will make you a...");
quest::itemlink(12003);

}
}

sub EVENT_ITEM
{
#sheet metal
if(($itemcount{10501} == 2) && ($itemcount{13006} == 1)  && ($platinum == 1))
   {
quest::say ("Here is your piece of sheet metal $name.");
quest::summonitem(12003);
	}

##############################SMALL BANDED#################################################
#small banded belt
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12033} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded belt $name.");
quest::summonitem(3071);
	}
#small banded boots
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12028} == 1) && ($platinum == 5))
   {
quest::say ("Here are your small banded boots $name.");
quest::summonitem(3076);
	}
#small banded bracer
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12005} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded bracer $name.");
quest::summonitem(3073);
	}
#small banded cloak
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12032} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded cloak $name.");
quest::summonitem(3070);
	}
#small banded gauntlets
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12091} == 1) && ($platinum == 5))
   {
quest::say ("Here are your small banded gauntlets $name.");
quest::summonitem(3074);
	}
#small banded gorget
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12004} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded gorget $name.");
quest::summonitem(3067);
	}
#small banded helm
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12029} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded helm $name.");
quest::summonitem(3065);
	}
#small banded leggings
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12029} == 1) && ($platinum == 10))
   {
quest::say ("Here is your small banded leggings $name.");
quest::summonitem(3075);
	}
#small banded mail
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12064} == 1) && ($platinum == 10))
   {
quest::say ("Here is your small banded mail $name.");
quest::summonitem(3068);
	}
#small banded mantle
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12031} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded mantle $name.");
quest::summonitem(3069);
	}
#small banded mask
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12030} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded mask $name.");
quest::summonitem(3066);
	}
#small banded sleeves
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12034} == 1) && ($platinum == 5))
   {
quest::say ("Here is your small banded sleeves $name.");
quest::summonitem(3072);
}

#####################################BANDED#NOT UPDATED##########################################
#banded belt
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12042} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded belt $name.");
quest::summonitem(3059);
	}
#banded boots
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12071} == 1) && ($platinum == 5))
   {
quest::say ("Here are your banded boots $name.");
quest::summonitem(3064);
	}
#banded bracer
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12007} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded bracer $name.");
quest::summonitem(3061);
	}
#banded cloak
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12041} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded cloak $name.");
quest::summonitem(3058);
	}
#banded gauntlets
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12092} == 1) && ($platinum == 5))
   {
quest::say ("Here are your banded gauntlets $name.");
quest::summonitem(3062);
	}
#banded gorget
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12006} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded gorget $name.");
quest::summonitem(3055);
	}
#banded helm
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12038} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded helm $name.");
quest::summonitem(3053);
	}
#banded leggings
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12044} == 1) && ($platinum == 10))
   {
quest::say ("Here is your banded leggings $name.");
quest::summonitem(3063);
	}
#banded mail
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12065} == 1) && ($platinum == 10))
   {
quest::say ("Here is your banded mail $name.");
quest::summonitem(3056);
	}
#banded mantle
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12040} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded mantle $name.");
quest::summonitem(3057);
	}
#banded mask
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12039} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded mask $name.");
quest::summonitem(3054);
	}
#banded sleeves
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12043} == 1) && ($platinum == 5))
   {
quest::say ("Here is your banded sleeves $name.");
quest::summonitem(3060);
}
###################################LARGE BANDED#NOT UPDATED################################
#large banded belt
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12051} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded belt $name.");
quest::summonitem(3083);
	}
#large banded boots
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12008} == 1) && ($platinum == 5))
   {
quest::say ("Here are your large banded boots $name.");
quest::summonitem(3088);
	}
#large banded bracer
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12010} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded bracer $name.");
quest::summonitem(3085);
	}
#large banded cloak
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12050} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded cloak $name.");
quest::summonitem(3082);
	}
#large banded gauntlets
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12093} == 1) && ($platinum == 5))
   {
quest::say ("Here are your large banded gauntlets $name.");
quest::summonitem(3089);
	}
#large banded gorget
elsif(($itemcount{12003}) && ($itemcount{13006} == 1) && ($itemcount{12009} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded gorget $name.");
quest::summonitem(3079);
	}
#large banded helm
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12047} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded helm $name.");
quest::summonitem(3077);
	}
#large banded leggings
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12053} == 1) && ($platinum == 10))
   {
quest::say ("Here is your large banded leggings $name.");
quest::summonitem(3087);
	}
#large banded mail
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12066} == 1) && ($platinum == 10))
   {
quest::say ("Here is your large banded mail $name.");
quest::summonitem(3080);
	}
#large banded mantle
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12049} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded mantle $name.");
quest::summonitem(3081);
	}
#large banded mask
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12048} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded mask $name.");
quest::summonitem(3078);
	}
#large banded sleeves
elsif(($itemcount{12003} == 2) && ($itemcount{13006} == 1) && ($itemcount{12052} == 1) && ($platinum == 5))
   {
quest::say ("Here is your large banded sleeves $name.");
quest::summonitem(3084);
}
}
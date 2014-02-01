###########Brimley Silver Jewelcrafter############
###Developed by Romell
###Date: 4.11.09

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
  quest::shout("Jewel Crafter for hire! Can enchant Silver bars for 5pp! Will craft anything Silver that I can for 10pp.");

}                                                                     
                                                                     
                                                                     
                                             
sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Hey there $name, I craft silver jewelry. I can craft many [ring]s and [necklace]s and some [misc] items. I can also [enchant] silver bars for 5pp ea. If you need materials Alister has them for sale.");
}
elsif ($text =~/misc/i)
{
quest::say ("1x Enchanted Silver bar 1x Onyx and 10pp will get you a...");
quest::itemlink(14624); #silver onyx bracelet
quest::say ("1x Enchanted Silver bar 1x Ruby and 10pp will get you a...");
quest::itemlink(14692); #silver ruby veil
quest::say ("1x Enchanted Silver bar 1x Star Ruby and 10pp will get you a...");
quest::itemlink(14680); #silvered star ruby veil
quest::say ("1x Enchanted Silver bar 1x Turquoise and 10pp will get you a...");
quest::itemlink(14608); # silver turquoise bracelet
quest::say ("1x Enchanted Silver bar 1x Bloodstone and 10pp will get you a...");
quest::itemlink(14620); # silver bloodstone earring
}
elsif ($text =~/ring/i)
{
quest::say ("1x Enchanted Silver bar 1x Carnelian and 10pp will get you a...");
quest::itemlink(14632); #silver carnelian wedding ring
quest::say ("1x Enchanted Silver bar 1x Diamond and 10pp will get you a...");
quest::itemlink(14704); #silver diamond wedding ring.
quest::say ("1x Enchanted Silver bar 1x Emerald and 10pp will get you a...");
quest::itemlink(14664); #silver emerald ring
quest::say ("1x Enchanted Silver bar 1x Fire Emerald and 10pp will get you a...");
quest::itemlink(14684); #silver fire emerald ring
quest::say ("1x Enchanted Silver bar 1x Fire Opal and 10pp will get you a...");
quest::itemlink(14676); #silver fire wedding ring
quest::say ("1x Enchanted Silver bar 1x Hematite and 10pp will get you a...");
quest::itemlink(14612); #silver hematite ring
#
quest::say ("1x Enchanted Silver bar 1x Jacinth and 10pp will get you a...");
quest::itemlink(14696); #silver jacinth wedding ring
quest::say ("1x Enchanted Silver bar 1x Jade and 10pp will get you a...");
quest::itemlink(14648); #jaded silver ring
quest::say ("1x Enchanted Silver bar 1x Jasper and 10pp will get you a...");
quest::itemlink(14628); #silver jasper ring
quest::say ("1x Enchanted Silver bar 1x Malachite and 10pp will get you a...");
quest::itemlink(14600); #silver malachite ring
quest::say ("1x Enchanted Silver bar 1x Opal and 10pp will get you a...");
quest::itemlink(14668); #silver opal engagement ring
quest::say ("1x Enchanted Silver bar 1x Pearl and 10pp will get you a...");
quest::itemlink(14652); #silvered pearl ring
#
quest::say ("1x Enchanted Silver bar 1x Peridot and 10pp will get you a...");
quest::itemlink(14660); #silvered peridot ring
quest::say ("1x Enchanted Silver bar 1x Star Rose Quartz and 10pp will get you a...");
quest::itemlink(14636); #silver rose engagement ring
quest::say ("1x Enchanted Silver bar 1x Amber and 10pp will get you a...");
quest::itemlink(14640); #silver amber ring
quest::say ("1x Enchanted Silver bar 1x Black Pearl and 10pp will get you a...");
quest::itemlink(14672); #blackened pearl silver ring
 }
elsif ($text =~/necklace/i)
{
quest::say ("1x Enchanted Silver bar 1x Cat Eye Agate and 10pp will get you a...");
quest::itemlink(14616); #silver cat eye necklace
quest::say ("1x Enchanted Silver bar 1x Lapis Lazuli and 10pp will get you a...");
quest::itemlink(14604); #silver lapis lazuli necklace
quest::say ("1x Enchanted Silver bar 1x Sapphire and 10pp will get you a...");
quest::itemlink(14688); #silvered sapphire necklace
quest::say ("1x Enchanted Silver bar 1x Topaz and 10pp will get you a...");
quest::itemlink(14656); #topaz silver necklace
quest::say ("1x Enchanted Silver bar 1x Wolf's Eye Agate and 10pp will get you a...");
quest::itemlink(14644); # silver wolf's eye necklace
quest::say ("1x Enchanted Silver bar 1x Black Sapphire and 10pp will get you a...");
quest::itemlink(14700); #black sapphire silvered necklace
	}
elsif ($text =~/enchant/i)
{
quest::say ("Hand me your silver bar and 5pp and I will enchant it for you.");
}
}

sub EVENT_ITEM
{
if(($itemcount{16500}) && ($platinum == 5))
   {
quest::say ("Here is your Enchanted Silver Bar.");
quest::summonitem(16504);
	}
elsif(($itemcount{10011}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Carnelian Wedding Ring");
quest::summonitem(14632);
	}
elsif(($itemcount{10026}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Cat Eye Necklace");
quest::summonitem(14616);
        }
elsif(($itemcount{10037}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Diamond Wedding Ring");
quest::summonitem(14704);
        }
elsif(($itemcount{10029}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Emerald Ring");
quest::summonitem(14664);
        }
elsif(($itemcount{10033}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silvered Fire Emerald Ring");
quest::summonitem(14684);
        }
elsif(($itemcount{10031}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silvered Fire Wedding Ring");
quest::summonitem(14676);
        }
elsif(($itemcount{10018}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Hematite Ring");
quest::summonitem(14612);
        }
elsif(($itemcount{10053}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Jacinth Wedding Ring");
quest::summonitem(14696);
        }
elsif(($itemcount{10023}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Jaded Silver Ring");
quest::summonitem(14648);
        }
elsif(($itemcount{10020}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Jasper Ring");
quest::summonitem(14628);
        }
elsif(($itemcount{10016}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Lapis Lazuli Necklace");
quest::summonitem(14604);
        }
elsif(($itemcount{10015}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Malachite Ring");
quest::summonitem(14600);
        }
elsif(($itemcount{10027}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Onyx Bracelet");
quest::summonitem(14624);
        }
elsif(($itemcount{10030}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Opal Engagement Ring");
quest::summonitem(14668);
        }
elsif(($itemcount{10031}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silvered Pearl Ring");
quest::summonitem(14652);
        }
elsif(($itemcount{10028}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silvered Peridot Ring");
quest::summonitem(14660);
        }
elsif(($itemcount{10035}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Ruby Vail");
quest::summonitem(14692);
        }
elsif(($itemcount{10034}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silvered Sapphire Necklace");
quest::summonitem(14688);
        }
elsif(($itemcount{10021}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Rose Engagement Ring");
quest::summonitem(14636);
        }
elsif(($itemcount{10032}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silvered Star Ruby Vail");
quest::summonitem(14680);
        }
elsif(($itemcount{10025}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Topaz Silver Necklace");
quest::summonitem(14656);
        }
elsif(($itemcount{10017}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Turquoise Bracelet");
quest::summonitem(14608);
        }
elsif(($itemcount{10010}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Wolf's Eye Necklace");
quest::summonitem(14644);
        }
elsif(($itemcount{10022}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Amber Ring");
quest::summonitem(14640);
        }
elsif(($itemcount{10019}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Silver Bloodstone Earring");
quest::summonitem(14620);
        }
elsif(($itemcount{10012}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Blackened Pearl Silver Ring");
quest::summonitem(14672);
        }
elsif(($itemcount{10036}) && ($itemcount{16504} == 1)  && ($platinum == 10))
   {
quest::say ("Black Sapphire Silvered Necklace");
quest::summonitem(14700);
	}
else {
plugin::return_items(\%itemcount);
}
}
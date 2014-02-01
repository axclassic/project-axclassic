###########Alistir Platinum Jewelcrafter############
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
  quest::shout("Jewel Crafter for hire! Will enchant Platinum bars for 5pp! Will craft anything Platinum that I can for 10pp. Have mats for sale!");

}                                                                     
                                                                     
                                                                     
                                             
sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Hey there $name, I craft Platinum jewelry. I can craft [ring]s, [necklace]s, [bracelet]s, [mask]s and an [earring]. I can also [enchant] Platinum bars for 5pp ea. I have mats for sale if you need any.");
}
elsif ($text =~/earring/i)
{
quest::say ("1x Enchanted Platinum bar 1x Bloodstone and 10pp will get you a...");
quest::itemlink(14623); #Platinum Bloodstone Earring
}
elsif ($text =~/bracelet/i)
{
quest::say ("1x Enchanted Platinum bar 1x Onyx and 10pp will get you a...");
quest::itemlink(14627); #Platinum Onyx Bracelet
quest::say ("1x Enchanted Platinum bar 1x Turquoise and 10pp will get you a...");
quest::itemlink(14611); #Platinum Turquoise Bracelet
}
elsif ($text =~/mask/i)
{
quest::say ("1x Enchanted Platinum bar 1x Ruby and 10pp will get you a...");
quest::itemlink(14695); #Platinum Ruby Vail
quest::say ("1x Enchanted Platinum bar 1x Star Ruby and 10pp will get you a...");
quest::itemlink(14683); #Platinum Star Ruby Vail
}
elsif ($text =~/ring/i)
{
quest::say ("1x Enchanted Platinum bar 1x Carnelian and 10pp will get you a...");
quest::itemlink(14635); #Platinum Carnelian Wedding Ring
quest::say ("1x Enchanted Platinum bar 1x Diamond and 10pp will get you a...");
quest::itemlink(14707); #Platinum Diamond Wedding Ring
quest::say ("1x Enchanted Platinum bar 1x Emerald and 10pp will get you a...");
quest::itemlink(14667); #Platinum Emerald Ring
quest::say ("1x Enchanted Platinum bar 1x Fire Emerald and 10pp will get you a...");
quest::itemlink(14687); #Fire Emerald Platinum Ring
quest::say ("1x Enchanted Platinum bar 1x Fire Opal and 10pp will get you a...");
quest::itemlink(14679); #Platinum Fire Wedding Ring
quest::say ("1x Enchanted Platinum bar 1x Hematite and 10pp will get you a...");
quest::itemlink(14615); #Platinum Hematite Ring
quest::say ("1x Enchanted Platinum bar 1x Jacinth and 10pp will get you a...");
quest::itemlink(14699); #Platinum Jacinth Wedding Ring
quest::say ("1x Enchanted Platinum bar 1x Jade and 10pp will get you a...");
quest::itemlink(14651); #Jaded Platinum Ring
quest::say ("1x Enchanted Platinum bar 1x Jasper and 10pp will get you a...");
quest::itemlink(14631); #Platinum Jasper Ring
quest::say ("1x Enchanted Platinum bar 1x Malachite and 10pp will get you a...");
quest::itemlink(14603); #Platinum Malachite Ring
quest::say ("1x Enchanted Platinum bar 1x Opal and 10pp will get you a...");
quest::itemlink(14671); #Platinum Opal Engagement Ring
quest::say ("1x Enchanted Platinum bar 1x Pearl and 10pp will get you a...");
quest::itemlink(14655); #Platinum Pearl Ring
quest::say ("1x Enchanted Platinum bar 1x Peridot and 10pp will get you a...");
quest::itemlink(14663); #Platinum Peridot Ring
quest::say ("1x Enchanted Platinum bar 1x Star Rose Quartz and 10pp will get you a...");
quest::itemlink(14639); #Rose Platinum Engagement Ring
quest::say ("1x Enchanted Platinum bar 1x Amber and 10pp will get you a...");
quest::itemlink(14643); #Platinum Amber Ring
quest::say ("1x Enchanted Platinum bar 1x Black Pearl and 10pp will get you a...");
quest::itemlink(14675); #Black Pearl Platinum Ring
 }
elsif ($text =~/necklace/i)
{
quest::say ("1x Enchanted Platinum bar 1x Cat Eye Agate and 10pp will get you a...");
quest::itemlink(14619); #Cat Eye Platinum Necklace 
quest::say ("1x Enchanted Platinum bar 1x Lapis Lazuli and 10pp will get you a...");
quest::itemlink(14607); #Platinum Lapis Lazuli Necklace
quest::say ("1x Enchanted Platinum bar 1x Sapphire and 10pp will get you a...");
quest::itemlink(14691); #Sapphire Platinum Necklace
quest::say ("1x Enchanted Platinum bar 1x Topaz and 10pp will get you a...");
quest::itemlink(14659); #Platinum Topaz Necklace
quest::say ("1x Enchanted Platinum bar 1x Wolf's Eye Agate and 10pp will get you a...");
quest::itemlink(14647); #Wolf's Eye Platinum Necklace
quest::say ("1x Enchanted Platinum bar 1x Black Sapphire and 10pp will get you a...");
quest::itemlink(14703); #Black Sapphire Platinum Necklace
	}
elsif ($text =~/enchant/i)
{
quest::say ("Hand me your Platinum Bar and 5pp and I will enchant it for you.");
}
}

sub EVENT_ITEM
{
if(($itemcount{16503}) && ($platinum == 5))
   {
quest::say ("Here is your Enchanted Platinum Bar.");
quest::summonitem(16507);
	}
elsif(($itemcount{10011}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Carnelian Wedding Ring");
quest::summonitem(14635);
	}
elsif(($itemcount{10026}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Cat Eye Platinum Necklace ");
quest::summonitem(14619);
        }
elsif(($itemcount{10037}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Diamond Wedding Ring");
quest::summonitem(14707);
        }
elsif(($itemcount{10029}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Emerald Ring");
quest::summonitem(14667);
        }
elsif(($itemcount{10033}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Fire Emerald Platinum Ring");
quest::summonitem(14687);
        }
elsif(($itemcount{10031}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Fire Wedding Ring");
quest::summonitem(14679);
        }
elsif(($itemcount{10018}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Hematite Ring");
quest::summonitem(14615);
        }
elsif(($itemcount{10053}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Jacinth Wedding Ring");
quest::summonitem(14699);
        }
elsif(($itemcount{10023}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Jaded Platinum Ring");
quest::summonitem(14651);
        }
elsif(($itemcount{10020}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Jasper Ring");
quest::summonitem(14631);
        }
elsif(($itemcount{10016}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Lapis Lazuli Necklace");
quest::summonitem(14607);
        }
elsif(($itemcount{10015}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Malachite Ring");
quest::summonitem(14603);
        }
elsif(($itemcount{10027}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Onyx Bracelet");
quest::summonitem(14627);
        }
elsif(($itemcount{10030}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Opal Engagement Ring");
quest::summonitem(14671);
        }
elsif(($itemcount{10031}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Pearl Ring");
quest::summonitem(14655);
        }
elsif(($itemcount{10028}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Peridot Ring");
quest::summonitem(14663);
        }
elsif(($itemcount{10035}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Ruby Vail");
quest::summonitem(14695);
        }
elsif(($itemcount{10034}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Sapphire Platinum Necklace");
quest::summonitem(14691);
        }
elsif(($itemcount{10021}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Rose Platinum Engagement Ring");
quest::summonitem(14639);
        }
elsif(($itemcount{10032}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Star Ruby Vail");
quest::summonitem(14683);
        }
elsif(($itemcount{10025}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Topaz Necklace");
quest::summonitem(14659);
        }
elsif(($itemcount{10017}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Turquoise Bracelet");
quest::summonitem(14611);
        }
elsif(($itemcount{10010}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Wolf's Eye Platinum Necklace");
quest::summonitem(14647);
        }
elsif(($itemcount{10022}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Amber Ring");
quest::summonitem(14643);
        }
elsif(($itemcount{10019}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Platinum Bloodstone Earring");
quest::summonitem(14623);
        }
elsif(($itemcount{10012}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Black Pearl Platinum Ring");
quest::summonitem(14675);
        }
elsif(($itemcount{10036}) && ($itemcount{16507} == 1)  && ($platinum == 10))
   {
quest::say ("Black Sapphire Platinum Necklace");
quest::summonitem(14703);
	}
else {
plugin::return_items(\%itemcount);
}
}
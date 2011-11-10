###########Radaf Electrum Jewelcrafter############
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
  quest::shout("Jewel Crafter for hire! Can enchant Electrum bars for 5pp! Will craft anything Electrum that I can for 10pp.");

}                                                                     
                                                                     
                                                                     
                                             
sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Hey there $name, I craft electrum jewelry. I can craft [ring]s, [necklace]s, [bracelet]s, a [mask] and [earring]s. I can also [enchant] electrum bars for 5pp ea. If you need materials Alister has them for sale.");
}
elsif ($text =~/earring/i)
{
quest::say ("1x Enchanted Electrum bar 1x Jasper and 10pp will get you a...");
quest::itemlink(14629); #Electrum Jasper Earring
quest::say ("1x Enchanted Electrum bar 1x Lapis Lazuli and 10pp will get you a...");
quest::itemlink(14605); #Electrum Lapis Lazuli Earring
quest::say ("1x Enchanted Electrum bar 1x Sapphire and 10pp will get you a...");
quest::itemlink(14689); #Sapphire Electrum Earring
quest::say ("1x Enchanted Electrum bar 1x Topaz and 10pp will get you a...");
quest::itemlink(14657); #Topaz Electrum Earring
quest::say ("1x Enchanted Electrum bar 1x Amber and 10pp will get you a...");
quest::itemlink(14641); #Amber Electrum Earring
quest::say ("1x Enchanted Electrum bar 1x Black Sapphire and 10pp will get you a...");
quest::itemlink(14701); #Black Sapphire Electrum Earring
}
elsif ($text =~/bracelet/i)
{
quest::say ("1x Enchanted Electrum bar 1x Jade and 10pp will get you a...");
quest::itemlink(14649); #Jaded Electrum Bracelet
quest::say ("1x Enchanted Electrum bar 1x Malachite and 10pp will get you a...");
quest::itemlink(14601); #Electrum Malachite Bracelet
quest::say ("1x Enchanted Electrum bar 1x Peridot and 10pp will get you a...");
quest::itemlink(14661); #Electrum Peridot Bracelet
quest::say ("1x Enchanted Electrum bar 1x Wolf's Eye Agate and 10pp will get you a...");
quest::itemlink(14645); #Wolf's Eye Electrum Bracelet
quest::say ("1x Enchanted Electrum bar 1x Cat Eye Agate and 10pp will get you a...");
quest::itemlink(14617); #Electrum Cat Eye Bracelet
quest::say ("1x Enchanted Electrum bar 1x Emerald and 10pp will get you a...");
quest::itemlink(14665); #Emerald Electrum Bracelet
quest::say ("1x Enchanted Electrum bar 1x Fire Emerald and 10pp will get you a...");
quest::itemlink(14685); #Fire Emerald Electrum Bracelet
}
elsif ($text =~/mask/i)
{
quest::say ("1x Enchanted Electrum bar 1x Diamond and 10pp will get you a...");
quest::itemlink(14705); #Diamond Electrum Mask
}
elsif ($text =~/ring/i)
{
quest::say ("1x Enchanted Electrum bar 1x Carnelian and 10pp will get you a...");
quest::itemlink(14633); #Electrum Carnelian Wedding Ring
quest::say ("1x Enchanted Electrum bar 1x Fire Opal and 10pp will get you a...");
quest::itemlink(14677); #Electrum Fire Wedding Ring
quest::say ("1x Enchanted Electrum bar 1x Jacinth and 10pp will get you a...");
quest::itemlink(14697); #Jacinth Electrum Wedding Ring
quest::say ("1x Enchanted Electrum bar 1x Ruby and 10pp will get you a...");
quest::itemlink(14693); #Ruby Electrum Ring
quest::say ("1x Enchanted Electrum bar 1x Star Ruby and 10pp will get you a...");
quest::itemlink(14681); #Electrum Star Ruby Ring
quest::say ("1x Enchanted Electrum bar 1x Turquoise and 10pp will get you a...");
quest::itemlink(14609); #Electrum Turquoise Engagement Ring
 }
elsif ($text =~/necklace/i)
{
quest::say ("1x Enchanted Electrum bar 1x Onyx and 10pp will get you a...");
quest::itemlink(14625); #Electrum Onyx Pendent
quest::say ("1x Enchanted Electrum bar 1x Opal and 10pp will get you a...");
quest::itemlink(14669); #Electrum Opal Amulet
quest::say ("1x Enchanted Electrum bar 1x Hematite and 10pp will get you a...");
quest::itemlink(14613); #Electrum Hematite Choker
quest::say ("1x Enchanted Electrum bar 1x Pearl and 10pp will get you a...");
quest::itemlink(14653); #Electrum Pearl Choker
quest::say ("1x Enchanted Electrum bar 1x Star Rose Quartz and 10pp will get you a...");
quest::itemlink(14637); #Electrum Star Amulet
quest::say ("1x Enchanted Electrum bar 1x Bloodstone and 10pp will get you a...");
quest::itemlink(14621); #Electrum Bloodstone Necklace
quest::say ("1x Enchanted Electrum bar 1x Black Pearl and 10pp will get you a...");
quest::itemlink(14673); #Black Pearl Electrum Choker
	}
elsif ($text =~/enchant/i)
{
quest::say ("Hand me your Electrum bar and 5pp and I will enchant it for you.");
}
}

sub EVENT_ITEM
{
if(($itemcount{16501}) && ($platinum == 5))
   {
quest::say ("Here is your Enchanted Electrum Bar.");
quest::summonitem(16505);
	}
elsif(($itemcount{10011}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Carnelian Wedding Ring");
quest::summonitem(14633);
	}
elsif(($itemcount{10026}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Cat Eye Bracelet");
quest::summonitem(14617);
        }
elsif(($itemcount{10037}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Diamond Electrum Mask");
quest::summonitem(14705);
        }
elsif(($itemcount{10029}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Emerald Electrum Bracelet");
quest::summonitem(14665);
        }
elsif(($itemcount{10033}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Fire Emerald Electrum Bracelet");
quest::summonitem(14685);
        }
elsif(($itemcount{10031}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Fire Wedding Ring");
quest::summonitem(14677);
        }
elsif(($itemcount{10018}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Hematite Choker");
quest::summonitem(14613);
        }
elsif(($itemcount{10053}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Jacinth Electrum Wedding Ring");
quest::summonitem(14697);
        }
elsif(($itemcount{10023}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Jaded Electrum Bracelet");
quest::summonitem(14649);
        }
elsif(($itemcount{10020}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Jasper Earring");
quest::summonitem(14629);
        }
elsif(($itemcount{10016}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Lapis Lazuli Earring");
quest::summonitem(14605);
        }
elsif(($itemcount{10015}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Malachite Bracelet");
quest::summonitem(14601);
        }
elsif(($itemcount{10027}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Onyx Pendent");
quest::summonitem(14625);
        }
elsif(($itemcount{10030}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Opal Amulet");
quest::summonitem(14669);
        }
elsif(($itemcount{10031}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Pearl Choker");
quest::summonitem(14653);
        }
elsif(($itemcount{10028}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Peridot Bracelet");
quest::summonitem(14661);
        }
elsif(($itemcount{10035}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Ruby Electrum Ring");
quest::summonitem(14693);
        }
elsif(($itemcount{10034}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Sapphire Electrum Earring");
quest::summonitem(14689);
        }
elsif(($itemcount{10021}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Star Amulet");
quest::summonitem(14637);
        }
elsif(($itemcount{10032}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Star Ruby Ring");
quest::summonitem(14681);
        }
elsif(($itemcount{10025}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Topaz Electrum Earring");
quest::summonitem(14657);
        }
elsif(($itemcount{10017}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Turquoise Engagement Ring");
quest::summonitem(14609);
        }
elsif(($itemcount{10010}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Wolf's Eye Electrum Bracelet");
quest::summonitem(14645);
        }
elsif(($itemcount{10022}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Amber Electrum Earring");
quest::summonitem(14641);
        }
elsif(($itemcount{10019}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Electrum Bloodstone Necklace");
quest::summonitem(14621);
        }
elsif(($itemcount{10012}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Black Pearl Electrum Choker");
quest::summonitem(14673);
        }
elsif(($itemcount{10036}) && ($itemcount{16505} == 1)  && ($platinum == 10))
   {
quest::say ("Black Sapphire Electrum Earring");
quest::summonitem(14701);
	}
else {
plugin::return_items(\%itemcount);
}
}
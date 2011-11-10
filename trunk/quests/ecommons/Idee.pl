###########Idee Gold Jewelcrafter############
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
  quest::shout("Jewel Crafter for hire! Can enchant Gold bars for 5pp! Will craft anything Gold that I can for 10pp.");

}                                                                     
                                                                     
                                                                     
                                             
sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Hey there $name, I craft Gold jewelry. I can craft [ring]s, [necklace]s, [bracelet]s. a [mask] and [earring]s. I can also [enchant] Gold bars for 5pp ea. If you need materials Alister has them for sale.");
}
elsif ($text =~/earring/i)
{
quest::say ("1x Enchanted Gold bar 1x Jasper and 10pp will get you a...");
quest::itemlink(14630); #Jasper Gold Earring
quest::say ("1x Enchanted Gold bar 1x Lapis Lazuli and 10pp will get you a...");
quest::itemlink(14606); #Gold Lapis Lazuli Earring
quest::say ("1x Enchanted Gold bar 1x Sapphire and 10pp will get you a...");
quest::itemlink(14690); #Golden Sapphire Earring
quest::say ("1x Enchanted Gold bar 1x Topaz and 10pp will get you a...");
quest::itemlink(14658); #Golden Topaz Earring
quest::say ("1x Enchanted Gold bar 1x Amber and 10pp will get you a...");
quest::itemlink(14642); #Golden Amber Earring
quest::say ("1x Enchanted Gold bar 1x Black Sapphire and 10pp will get you a...");
quest::itemlink(14702); #Golden Black Sapphire Earring
}
elsif ($text =~/bracelet/i)
{
quest::say ("1x Enchanted Gold bar 1x Cat Eye Agate and 10pp will get you a...");
quest::itemlink(14618); #Golden Cat Eye Bracelet
quest::say ("1x Enchanted Gold bar 1x Emerald and 10pp will get you a...");
quest::itemlink(14666); #Golden Emerald Bracelet
quest::say ("1x Enchanted Gold bar 1x Fire Emerald and 10pp will get you a...");
quest::itemlink(14686); #Fire Emerald Golden Bracelet
quest::say ("1x Enchanted Gold bar 1x Jade and 10pp will get you a...");
quest::itemlink(14650); # Golden Jaded Bracelet
quest::say ("1x Enchanted Gold bar 1x Malachite and 10pp will get you a...");
quest::itemlink(14602); #Gold Malachite Bracelet
quest::say ("1x Enchanted Gold bar 1x Peridot and 10pp will get you a...");
quest::itemlink(14662); #Golden Peridot Bracelet
quest::say ("1x Enchanted Gold bar 1x Wolf's Eye Agate and 10pp will get you a...");
quest::itemlink(14646); #Wolf's Eye Golden Bracelet
}
elsif ($text =~/mask/i)
{
quest::say ("1x Enchanted Gold bar 1x Diamond and 10pp will get you a...");
quest::itemlink(14706); #Golden Diamond Mask
}
elsif ($text =~/ring/i)
{
quest::say ("1x Enchanted Gold bar 1x Carnelian and 10pp will get you a...");
quest::itemlink(14634); #Gold Carnelian Wedding Ring
quest::say ("1x Enchanted Gold bar 1x Fire Opal and 10pp will get you a...");
quest::itemlink(14678); #Golden Fire Wedding Ring
quest::say ("1x Enchanted Gold bar 1x Jacinth and 10pp will get you a...");
quest::itemlink(14698); #Golden Jacinth Wedding Ring
quest::say ("1x Enchanted Gold bar 1x Ruby and 10pp will get you a...");
quest::itemlink(14694); #Golden Ruby Ring
quest::say ("1x Enchanted Gold bar 1x Star Ruby and 10pp will get you a...");
quest::itemlink(14682); #Golden Star Ruby Ring
quest::say ("1x Enchanted Gold bar 1x Turquoise and 10pp will get you a...");
quest::itemlink(14610); #Gold Turquoise Engagement Ring
 }
elsif ($text =~/necklace/i)
{
quest::say ("1x Enchanted Gold bar 1x Hematite and 10pp will get you a...");
quest::itemlink(14614); #Golden Hematite Choker
quest::say ("1x Enchanted Gold bar 1x Onyx and 10pp will get you a...");
quest::itemlink(14626); #Gold Onyx Pendent
quest::say ("1x Enchanted Gold bar 1x Opal and 10pp will get you a...");
quest::itemlink(14670); #Golden Opal Amulet
quest::say ("1x Enchanted Gold bar 1x Pearl and 10pp will get you a...");
quest::itemlink(14654); #Golden Pearl Choker
quest::say ("1x Enchanted Gold bar 1x Star Rose Quartz and 10pp will get you a...");
quest::itemlink(14638); #Golden Star Amulet
quest::say ("1x Enchanted Gold bar 1x Bloodstone and 10pp will get you a...");
quest::itemlink(14622); #Gold Bloodstone Necklace
quest::say ("1x Enchanted Gold bar 1x Black Pearl and 10pp will get you a...");
quest::itemlink(14674); #Golden Black Pearl Choker
	}
elsif ($text =~/enchant/i)
{
quest::say ("Hand me your Gold bar and 5pp and I will enchant it for you.");
}
}

sub EVENT_ITEM
{
if(($itemcount{16502}) && ($platinum == 5))
   {
quest::say ("Here is your Enchanted Gold Bar.");
quest::summonitem(16506);
	}
elsif(($itemcount{10011}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Gold Carnelian Wedding Ring");
quest::summonitem(14634);
	}
elsif(($itemcount{10026}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Cat Eye Bracelet");
quest::summonitem(14618);
        }
elsif(($itemcount{10037}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Diamond Mask");
quest::summonitem(14706);
        }
elsif(($itemcount{10029}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Emerald Bracelet");
quest::summonitem(14666);
        }
elsif(($itemcount{10033}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Fire Emerald Golden Bracelet");
quest::summonitem(14686);
        }
elsif(($itemcount{10031}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Fire Wedding Ring");
quest::summonitem(14678);
        }
elsif(($itemcount{10018}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Hematite Choker");
quest::summonitem(14614);
        }
elsif(($itemcount{10053}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Jacinth Wedding Ring");
quest::summonitem(14698);
        }
elsif(($itemcount{10023}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Jaded Bracelet");
quest::summonitem(14650);
        }
elsif(($itemcount{10020}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Jasper Gold Earring");
quest::summonitem(14630);
        }
elsif(($itemcount{10016}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Gold Lapis Lazuli Earring");
quest::summonitem(14606);
        }
elsif(($itemcount{10015}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Gold Malachite Bracelet");
quest::summonitem(14602);
        }
elsif(($itemcount{10027}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Gold Onyx Pendent");
quest::summonitem(14626);
        }
elsif(($itemcount{10030}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Opal Amulet");
quest::summonitem(14670);
        }
elsif(($itemcount{10031}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Pearl Choker");
quest::summonitem(14654);
        }
elsif(($itemcount{10028}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Peridot Bracelet");
quest::summonitem(14662);
        }
elsif(($itemcount{10035}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Ruby Ring");
quest::summonitem(14694);
        }
elsif(($itemcount{10034}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Sapphire Earring");
quest::summonitem(14690);
        }
elsif(($itemcount{10021}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Star Amulet");
quest::summonitem(14638);
        }
elsif(($itemcount{10032}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Star Ruby Ring");
quest::summonitem(14682);
        }
elsif(($itemcount{10025}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Topaz Earring");
quest::summonitem(14658);
        }
elsif(($itemcount{10017}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Gold Turquoise Engagement Ring");
quest::summonitem(14610);
        }
elsif(($itemcount{10010}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Wolf's Eye Golden Bracelet");
quest::summonitem(14646);
        }
elsif(($itemcount{10022}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Amber Earring");
quest::summonitem(14642);
        }
elsif(($itemcount{10019}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Gold Bloodstone Necklace");
quest::summonitem(14622);
        }
elsif(($itemcount{10012}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Black Pearl Choker");
quest::summonitem(14674);
        }
elsif(($itemcount{10036}) && ($itemcount{16506} == 1)  && ($platinum == 10))
   {
quest::say ("Golden Black Sapphire Earring");
quest::summonitem(14702);
	}
else {
plugin::return_items(\%itemcount);
}
}
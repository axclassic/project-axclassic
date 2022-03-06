##Translocator_Narrik.pl
#Zone: OoT

sub EVENT_SAY {
my $freeport = quest::saylink("travel to freeport", 1);
my $butcher = quest::saylink("travel to butcherblock", 1);
if ($text=~/Hail/i){quest::say("Hello there. There seems to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to $freeport or $butcher in the meantime, I can transport you to my companion there."); }
if ($text=~/travel to freeport/i){quest::selfcast("2283"); }
if ($text=~/travel to butcherblock/i){quest::selfcast("2281"); } 
} 
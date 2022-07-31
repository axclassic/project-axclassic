# EPIC CLERIC (Timorous deep)
sub EVENT_WAYPOINT {
    if ($wp == 12) {
    quest::depop();
 }
 }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28023 => 1)) { #Orb of the triumvirate
    quest::emote("takes the orb from you. The avatar has determined that you are worthy!");
    quest::summonitem(5532); # Water Sprinkler of Nem Ankh 
    quest::summonitem(628);  # BattleRez Scroll
    quest::ding(); quest::exp(350000);
    quest::shout2("Denizens of The Rathe. Please join me in congratulating $name for earning the Cleric Epic: Water Sprinkler of Nem Ankh!");
    if($class ne 'Cleric') {
        quest::shout2("...probably for a Bot since $name is a $class");
    }
    quest::depop();
  }
  else {
    quest::emote("ignores you.");
    plugin::return_items(\%itemcount); # return unused items
  }
}
#End of File, Zone:timorous  NPC:96086 -- Avatar of Water
################################
##      Paladin Epic 1.0      ##
##      Created by Aardil     ##
##        11-23-2013          ##
## NPCID: 10206 peasant_woman ##
##      Zone: freporte        ##
################################

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::emote("grunts as she tries to fill two buckets of water from the barrel. Her frail arms strain at her work and pain fills her eyes with tears.'");
  }
  if ($text=~/water/i) {
    quest::say("Aye, water m'lord. For my brother. He is very sick. He's needin' drink. He's burning up. I am sick myself but still able to move, a little. I must get this water to him before he gets worse.");
  }
  if ($text=~/take/i) {
    quest::say("Surely you are a pure soul. If you would take this bucket of water to my brother, I would be forever grateful. I'm just so tired, I need rest...");
   	quest::emote("slumps to the ground and begins to breathe shallowly, in short, harsh gasps.");
	quest::summonitem(29008); #bucket of water
	}
}

#END of FILE Zone:freporte  ID:10206 -- peasant_woman
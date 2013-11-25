############################
##    Edited by Aardil    ##
##    Dialogue repairs    ##
##   Added Joshua spawn   ##
##      11-25-2013        ##
############################
sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::emote("grunts as she tries to fill two buckets of water. Her frail arms strain at her work and pain fills her eyes with tears.");
 }

 if($text=~/Water/i)
 {
 quest::say("Aye, water, m'lord. For my brother. He is very sick. He's needin' drink. He's burnin' up. I am sick myself but still able to move, a little. I must take this water to him before he gets worse.");
 }

 if($text=~/take/i)
 {
 quest::say("Surely you are a pure soul. If you would take this bucket of water to my brother, I would be forever grateful. I am just so tired, I need to rest...");
 quest::emote("slumps to the floor and begins to breathe shallowly, in short, harsh gasps.");
 quest::summonitem("29008");  # bucket of water ID-29008
 }

}

#END of FILE Zone:freportw  ID:9122 -- peasant_woman
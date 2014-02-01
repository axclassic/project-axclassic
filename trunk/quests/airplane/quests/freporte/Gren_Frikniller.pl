############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Gren_Frikniller
# ID: 10122
# TYPE: Rogue
# RACE: Halfling
# LEVEL: 14
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Letter to Falia ID-18925
# Broken Heirloom Necklace ID-13159
#
# *** QUESTS INVOLVED IN ***
#
#
#
# *** QUESTS AVAILABLE TO ***
#
#
#
# *** NPC NOTES ***
#
#
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Aya. howdy there. $name.  The name's Gren Frikniller.  'Niller the Killer' The only person who can give me a run for my money is my [sister].");
}

if($text=~/sister/i)
{
quest::say("The one and only Falia Frikniller. By a good little grunt and take this letter to her will ya.");
# Letter to Falia ID-18925
quest::summonitem("18925");
}

if($text=~/rivervale/i)
{
quest::say("Rivervale?  Well. it's far from here. thank Fizzlethorpe.  They got more wanted posters with my face on 'em than they got trees there.  I mean. 'tweren't my fault either.  Just a friendly game of cards. and this little weasel catches me with an extra ace up my sleeve.  Can you believe this kid calls ol' Grenny here a cheater. right in front of the whole bar?!!  So. you know. I gave him a quick cut. ear to ear. with me dagger...  just to shut him up. you know.  Suddenly. I'm a murderer?  For simply defending myself?! Go figure!");
}

if($text=~/elisi/i)
{
quest::say("Elisi runs the show around here.  She's usually a pretty busy lady.  Dang smart. too.  And it's my sworn duty to protect her at any cost. even with my very own life.");
}

}

sub EVENT_ITEM
{
   # Broken Heirloom Necklace ID-13159
   if($itemcount{13159} == 1)
   {
   quest::say("To you this heirloom isn't worth anything. But you have no idea what this is worth to me. Thanks $name.");
   quest::ding(); quest::exp("100");
   

   # Coalition of TradeFolk III Faction
   quest::faction("369","1");
   # Coalition of Trade Folk Faction
   quest::faction("47","1");
   # Carson McCabe Faction
   quest::faction("31","1");
   # Corrupt Qeynos Guards Faction
   quest::faction("53","1");
   # Freeport Militia Faction
   quest::faction("105","1");


   }
}


#END of FILE Zone:freporte  ID:10122 -- Gren_Frikniller



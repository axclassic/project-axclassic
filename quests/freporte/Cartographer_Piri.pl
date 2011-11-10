############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: July 29,2005
# VERSION: 1.0
# BASE QUEST BY: MWMDRAGON
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Cartographer_Piri
# ID: 10115
# TYPE: Wizard
# RACE: Human
# LEVEL: 60
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Cartography Binder ID- 17710
# A Coordinate Label ID- 63003
# A Compass Notation ID- 63001
# A Map Legend ID- 63002
# Completed Cartography Binder ID-63005 (Not used as the MySQL does not exsist yet)
# Skyfall Seeker ID-63048
#
# *** QUESTS INVOLVED IN ***
#
#1 - Skyfall Seeker
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
# *** NPC NOTES ***
#
#
#
############################################

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("Hail, traveler! Would you have a moment? I'm in need of some [assistance].");
   }

   if($text=~/assistance/i)
   {
   quest::say("Thank you! I'll make it worth your while. I recently discovered the remains of an odd little map that may detail the distant Gulf of Gunthak. The map itself, however, is in a horrible state... a suspiciously horrible state if you ask me. Much of it is [missing].");
   }

   if($text=~/missing/i)
   {
   quest::say("The pirates of Broken Skull Rock have purposefully destroyed any accurate maps to protect the secrecy of their base. Three key parts are damaged. The compass notation, the legend and the coordinate label are all gone. Take this Cartography Binder. Use it to [collect] the fragments.");
   }

    if($text=~/collect/i)
   {
   quest::say("No doubt the pirates will have some of the fragments. Search Broken Skull Rock, paying careful attention to Gunthak and Dulak Harbor. An accurate map must be made. It is the first step in breaking the pirates' hold on the region. Good luck. The three pieces needed are A Coordinate Label, A Compass Notation, and A Map Legend.");
   # Cartography Binder ID- 17710
   quest::summonitem("17710");
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Cartography Binder ID- 17710, A Coordinate Label ID- 63003, A Compass Notation ID- 63001, A Map Legend ID- 63002
   if($itemcount{17710} == 1 && $itemcount{63003} == 1 && $itemcount{63001} == 1 && $itemcount{63002} == 1)
   {
   
   quest::say("Incredible! With a little work, I will be able to create a finished map of the Gulf of Gunthak. No longer will the pirates be able to keep their lair a secret. Thank you! Please take this as a reward for your efforts.");
   quest::ding(); quest::exp("200");

   # Skyfall Seeker ID-63048
   quest::summonitem("63048");

   }
}

######## EVENT_AGGRO AREA ##################
### Called when the NPC is aggroed

sub EVENT_AGGRO
{



}

######## EVENT_ATTACK AREA #################
### Called when the NPC is Attacked

sub EVENT_ATTACK
{



}

######## EVENT_DEATH AREA ##################
### Called when the NPC is killed

sub EVENT_DEATH
{



}

######## EVENT_ENTER AREA ##################
### Called when a PC enters the NPCs Proximity

sub EVENT_ENTER
{



}

######## EVENT_EXIT AREA ###################
### Called when a PC exits the NPCs Proximity

sub EVENT_EXIT
{



}

######## EVENT_HP AREA #####################
### Called when the HP of the NPC drop below a set level

sub EVENT_HP
{



}

######## EVENT_SIGNAL AREA #################
### Called when a signal is sent to the NPC

sub EVENT_SIGNAL
{



}

######## EVENT_SLAY AREA ###################
### Called when the NPC kills someone

sub EVENT_SLAY
{



}

######## EVENT_SPAWN AREA ##################
### Called when the NPC spawns

sub EVENT_SPAWN
{



}

######## EVENT_TIMER AREA ##################
### Called when a timer has completed its cycle

sub EVENT_TIMER
{



}

######## EVENT_WAYPOINT AREA ###############
### Called when the NPC reaches a waypoint

sub EVENT_WAYPOINT
{



}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10115 -- Cartographer_Piri




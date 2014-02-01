############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 13,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Tohsan_Hallard
# ID: 10053
# TYPE: Shopkeeper
# RACE: Freeport Guards
# LEVEL: 45
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Orc Pawn Pick ID- 13885
#
# -= Random Reward Selection =-
#
# Lottery Ticket # 14001 ID-12265
# Lottery Ticket # 14350 ID-12264
# Lottery Ticket # 15600 ID-12261
# Lottery Ticket # 15601 ID-12262
# Lottery Ticket # 15602 ID-12263
# Lottery Ticket # 16568 ID-12266
#
# *** QUESTS INVOLVED IN ***
#
#1 - Orc Picks and Lottery Tickets
#2 -  Princess Lenya quest
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#2 - Paladin
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
quest::say("Greetings and welcome to Hallard's!  You will find many aged weapons begging you to shine them up and make them great once more.  We will gladly pay you top dollar for any rusty weapons you may have found littering the Commonlands.  I have a [special offer] for those who have obtained orc pawn picks.");
}

if($text=~/what special offer/i)
{
quest::say("I will pay some silver pieces for every four orc pawn picks returned to me.  I shall also throw in a ticket to the Highpass Hold lottery.  It could be a winner!!");
}

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # Orc Pawn Pick ID- 13885
   if($itemcount{13885} == 4)
   {
   
   quest::say("As I promised, some silver and of course, the Highpass lottery ticket. Oh yes, I forgot to mention the ticket was for last season's lottery. Ha Ha!! You now own a losing Highpass lottery ticket, lucky you! Ha!!");
   quest::ding(); quest::exp("50");
   quest::givecash("0","3","0","0");

   ### Random Item choosing if needed
   # Lottery Ticket # 14001 ID-12265 - Lottery Ticket # 14350 ID-12264 - Lottery Ticket # 15600 ID-12261 - Lottery Ticket # 15601 ID-12262 - Lottery Ticket # 15602 ID-12263 - Lottery Ticket # 16568 ID-12266
   $random=int(rand 12265+12264+12261+12262+12263+12266);
   quest::summonitem($randon);

   # Coalition of Tradefolk Faction ID - 47
   quest::faction("47","1");
   # Knights of Truth  Faction ID - 184
   quest::faction("184","1");
   # Merchants of Qeynos Faction ID - 217
   quest::faction("217","1");
   # Coalition of Tradesfolk Underground Faction ID - 48
   quest::faction("48","1");
   }
}

######## EVENT_AGGRO AREA ##################
### Called when the NPC is aggroed

sub EVENT_AGGRO
{

# Null

}

######## EVENT_ATTACK AREA #################
### Called when the NPC is Attacked

sub EVENT_ATTACK
{

# Null

}

######## EVENT_DEATH AREA ##################
### Called when the NPC is killed

sub EVENT_DEATH
{

# Null

}

######## EVENT_ENTER AREA ##################
### Called when a PC enters the NPCs Proximity

sub EVENT_ENTER
{

# Null

}

######## EVENT_EXIT AREA ###################
### Called when a PC exits the NPCs Proximity

sub EVENT_EXIT
{

# Null

}

######## EVENT_HP AREA #####################
### Called when the HP of the NPC drop below a set level

sub EVENT_HP
{

# Null

}

######## EVENT_SIGNAL AREA #################
### Called when a signal is sent to the NPC

sub EVENT_SIGNAL
{

# Null

}

######## EVENT_SLAY AREA ###################
### Called when the NPC kills someone

sub EVENT_SLAY
{

# Null

}

######## EVENT_SPAWN AREA ##################
### Called when the NPC spawns

sub EVENT_SPAWN
{

# Null

}

######## EVENT_TIMER AREA ##################
### Called when a timer has completed its cycle

sub EVENT_TIMER
{

# Null

}

######## EVENT_WAYPOINT AREA ###############
### Called when the NPC reaches a waypoint

sub EVENT_WAYPOINT
{

# Null

}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10053 -- Tohsan_Hallard



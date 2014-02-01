#########################################################################
# ZONE: North Ro (nro)
# DATABASE:  AX-Classic 3.11c
# LAST EDIT DATE: August 14, 2009
# VERSION: 1.0 
# DEVELOPER: Asram
# REVISION NOTES: Initial Draft
#
# *** NPC INFORMATION ***
#
# NAME: Dorn B`Dynn
# ID: 34082
# RACE: 6
# CLASS: 1
# LEVEL: 14
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Sealed Letter ID-18886 (Given)
#
# *** QUESTS INVOLVED IN ***
#
# 287 - Marda's Secret Mission
#

sub EVENT_SAY {

 if($text=~/hail/i) {
  quest::say("Just who are you? Do you expect some sort of courteous greeting? I have no time for idle chitchat!! Either you are here to [attend to business] or you seek shelter, which is it?");
    }
 elsif($text=~/attend to business/i)  {
  quest::say("So, business is your mission! I have never met you. Who sent you?");
    }
 elsif($text=~/Zimbittle/i) {
  quest::say("I do not know if I could trust you. You certainly do not look as though you are from Grobb, although your stench does hint of that place. If you are truly sent by Zimbittle, what is the password?");
    }
  elsif(($text=~/Mukk/i) && ($faction <5)) {
  quest::say("So you were sent by Zimbittle. Take this note to Kragia of Da Bashers in Grobb. Do not lose the note. If it were to fall into the wrong hands of [Goonda], this whole plan could be disrupted. Now, leave, I can no longer tolerate you foul stench!");
  quest::summonitem(18886);
    }
  elsif($text=~/Goonda/i) {
quest::say("In the western planes of Karana, you will find Goonda. He seems to be the Ogre shaman in charge out there.");
  } 
}      
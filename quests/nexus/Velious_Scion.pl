#Modified by AngeloX
sub EVENT_SAY 
{ 
  if ($text=~/Hail/i)
  {
    quest::say("Greetings $name. I am here to assist and watch over those who wish to return to the continent of Velious.  Due to the limited space I share this area with the portal to Odus.  Do you wish to [journey to Velious]?"); 
  }
  if ($text=~/journey to Velious/i)
  {
    quest::say("Very well.");
    quest::castspell($userid,2708);# for the looks
    quest::movepc(118,-2695.2,-1885.4,-45.7);
  }
}
#END of FILE Zone:nexus  ID:152018 -- Velious_Scion 


#cb: made it actually work
sub EVENT_SAY 
{ 
  if ($text=~/Hail/i)
  {
    quest::say("Greetings $name. I am Horender Tevalian. I was one of the first to travel to Luclin when the secrets of the teleports were unlocked. Once here. the Midst Collective asked that I maintain vigil over the portal back to the Karanas. Do you wish to [journey to Antonica]?"); 
  }
  if ($text=~/journey to Antonica/i)
  {
    quest::say("Very well.");
    quest::castspell($userid,2708);# for the looks
    quest::selfcast(1338);# translocate: north
  }
}
#END of FILE Zone:nexus  ID:152005 -- Antonica_Scion 


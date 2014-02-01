#cb: made it actually work
sub EVENT_SAY 
{ 
  if ($text=~/Hail/i)
  {
    quest::say("Hello $name. Welcome to the Kunark translocation area. Do you wish to [journey to Kunark]?"); 
  }
  if ($text=~/journey to Kunark/i)
  {
    quest::say("Very well.");
    quest::castspell($userid,2708);# for the looks
    quest::selfcast(1339);# translocate: combine
  }
}
#END of FILE Zone:nexus  ID:152004 -- Kunark_Scion 


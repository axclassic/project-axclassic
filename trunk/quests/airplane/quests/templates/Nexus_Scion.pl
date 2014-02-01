# cb: made it actually work
sub EVENT_SAY 
{ 
  if ($text=~/Hail/i)
  {
    quest::say("Hello $name. I do not have much time to chat. I must concentrate on the portal that is due to open soon. If you wish to [journey to Luclin], tell me so."); 
  }
  if ($text=~/journey to Luclin/i)
  {
    quest::say("Very well.");
    #quest::castspell($userid,2935);
    quest::selfcast(2935);#for looks only - it doesnt do anything
    quest::selfcast(2943);#translocate: nexus
  }
}

#END of FILE Zone:northkarana  ID:13060 -- Nexus_Scion 


#cb: made it actually work
sub EVENT_SAY 
{ 
  if ($text=~/Hail/i)
  {
    quest::say("Greetings $name. I am Kendal Groetan. I am here to assist and watch over those who  wish to [journey to Odus]."); 
    quest::say("I can also assist you with a portal to the Plane of Sky, for a fee of 50pp") 
  }
  if ($text=~/journey to Odus/i)
  {
    quest::say("Very well.");
    quest::castspell($userid,2708);# for the looks
    quest::selfcast(1337);# translocate: tox
  }
}

sub EVENT_ITEM{
  if ($platinum>=50){
    quest::say("Very well then.");
    $npc->SetAppearance(0);
    quest::selfcast(674);
 }
}
#END of FILE Zone:nexus  ID:152003 -- Odus_Scion 


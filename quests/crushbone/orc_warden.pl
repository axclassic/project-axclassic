#Orc Warden, Crushbone
#Status: COMPLETE

sub EVENT_ATTACK
{
  $rand = rand();
  if($rand < .3)
  {
  quest::say("Death!!  Death to all who oppose the Crushbone orcs!!");
  }
  if($rand > .67)
  {
  quest::say("Hail, Emperor Crush!!");
  }
  if(($rand >= .3)  && ($rand <= .67))
  { 
  quest::say("Fall before the might of Clan Crushbone!!");
  }
}

sub EVENT_DEATH
{
  quest::say("You shall have all the Crushbone orc legions on your tail for my death!");
}


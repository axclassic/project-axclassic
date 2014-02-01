sub delay{
   $delayOver = (time + @_[0]);
   while (time < $delayOver){}
   1;
}

sub EVENT_DEATH{
  delay(30);
  quest::say("Hail");
}
#NPC: Droon   Zone: eastkarana
#by Qadar

sub EVENT_DEATH {
  quest::say("Ugh..  You beat Droon.  You am strong little thing..  Argh..");
  my $random_result = int(rand(100));
  if($random_result < 85){
     quest::unique_spawn(15160,135,0,829,1982,95);
  }
}

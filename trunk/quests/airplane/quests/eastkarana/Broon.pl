#NPC: Broon   Zone: eastkarana
#by Qadar

sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::say("Broon will crush you like little pumpkin. Bwahaha!!");
  }
}

sub EVENT_DEATH {
  quest::say("ARGH!!  You will pay, tiny thing!!  My big brother Droon will make you dead!  And if papa Proon gets you..  argh.. you will be stain on his feets..  argh.");
  my $random_result = int(rand(100));
  if($random_result < 85){
     quest::unique_spawn(15160,135,0,829,1982,95);
  }
}


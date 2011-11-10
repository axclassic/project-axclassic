#npc - Gfaydark Guard Protectors
#zone - Gfaydark
#by Angelox

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("For the defense of Kelethin!!");
   }
}

sub EVENT_SIGNAL {
   quest::say("For the protection of all Fier'Dal, there shall be no mercy for your kind.");
}

sub EVENT_ATTACK {
  my $random_result = int(rand(100));
  if(($combat_state == 1) &&($random_result<=17)){
    quest::say("Another corpse for the caretaker ...");
  }elsif(($combat_state == 1) &&($random_result<=34)){
    quest::say("You fool!");
  }elsif(($combat_state == 1) &&($random_result<=51)){
    quest::say("Let me polish my sword with your skin!");
  }elsif(($combat_state == 1) &&($random_result<=68)){
    quest::say("Now feel the wrath of my sword!");
  }elsif(($combat_state == 1) &&($random_result<=85)){
    quest::say("Your death will come quickly!");
  }elsif($combat_state == 1){
    quest::say("I'll skin you alive!");}
}

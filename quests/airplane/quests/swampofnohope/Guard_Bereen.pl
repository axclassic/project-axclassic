#npc - swampofnohope Guard Protectors
#zone - swampofnohopek
#by Angelox

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Well met $name!");
  quest::say("Carry on!");
 }
}

sub EVENT_COMBAT {
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
    quest::say("For the protection of all Frogloksl, there shall be no mercy for your kind.");}
}

sub EVENT_ATTACK{
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
    quest::say("For the protection of all Frogloksl, there shall be no mercy for your kind.");}
}



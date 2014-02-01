#############
#Quest Name: ~EMPTY~
#Author: TBA
#NPCs Involved: Guard_Fragg
#Items Involved:
#zone: swampofnohope
#Revised: Angelox, Crabclaw

sub EVENT_SAY {
	my $greetings = int(rand(4));
	if($text=~/Hail/i && $greetings == 0){
		quest::say("Greetings and well met!");
	}elsif($text=~/Hail/i && $greetings == 1){
		quest::say("<Frooooak!>. Move along!");
	}elsif($text=~/Hail/i && $greetings == 2){
		quest::say("<Ribbit!> I am on the lookout for rogues. Make way!");
	}elsif($text=~/Hail/i && $greetings == 3){
		quest::say("Yes?");
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

#END of FILE Zone:swampofnohope ID:83314

#NPC: a_minotaur_slaver   Zone: steamfont
#
#Emotes & Chance to trigger Minotaur Hero spawn on death
#
#by Qadar

sub EVENT_COMBAT{
  if($combat_state == 1){
    quest::say("<Snort!!>..  Death to you! Meldrath commands!!");
  }
}

sub EVENT_DEATH{
  my $random_result = int(rand(100));
  if($random_result <= 20){
    quest::unique_spawn(56152,177,0,-1294,1360,-103);
  }
  elsif($random_result <= 40) {
    quest::unique_spawn(56161,0,0,-2161.2,1320.5,-100.3);
  }
  quest::say("I die soon! Meldrath, help me!");
}

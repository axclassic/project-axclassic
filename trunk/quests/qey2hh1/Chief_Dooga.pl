#Status Unfinished, even on Live

sub EVENT_SAY { 
  if(($text=~/Hail/i) && ($faction<5)){
quest::say("'Greetings to you, $name. What business do you have with us? We are quite busy with the [enchantment of the stone]."); 
  }
  elsif(($text=~/enchantment of the stone/i) && ($faction<3)){
quest::say("I would have you assist, $name, but we have not finished our preparations."); 
  }
elsif($text=~/enchantment of the stone/i) {
  quest::say("Begone. I would not discuss this matter with you.");
  
}
}

sub EVENT_DEATH {
quest::echo("Now there is no chance for the enchantment of the stone.");
}
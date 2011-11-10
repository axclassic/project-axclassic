
#npc - Frankel the Pirate
#zone - NRO
#by Angelox

sub EVENT_SAY {
 if($text=~/hail/i){ ## I found this in the net
  quest::say("Hey there $name, you look like a $race in search of opportunity. If I'm right and I know I am, then where better than the land of ice, rocks and ice? Oh, with giants and dragons from sea to shining sea. That piqued your [interest], eh?");
   }
 if($text=~/interest/i){ ## Had to make this up
  quest::say("Aye, if ye wants me to take ye there, stand at the edge of the pier and waits for me raft.");
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
  }elsif($combat_state == 1){ ##I thought this was funny, saw it at the 'Zam
    quest::say("Argggh I don't believe I never expected to win ye award for the most underconed NPC in the game - I thank ye for this award and if any of ye be getting in me way you'll be seeing the me fist stuffed down ye throat faster than you can you know what hit ye!");}
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
    quest::say("Argggh I don't believe I never expected to win ye award for the most underconed NPC in the game - I thank ye for this award and if any of ye be getting in me way you'll be seeing the me fist stuffed down ye throat faster than you can you know what hit ye!");}
}

sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Rrraaarrr! Hello furless. You come to study from [mighty warrior] yes?");
  }
  elsif($text=~/mighty warrior/i){
    quest::say("Errr. Well, Allix not yet mighty warrior but soon yes. Allix just come of age and soon will enter training to become mighty Pasdar. Errr. Allix little nervous. Allix missing [one thing] to become mighty Pasdar.");
  }
  elsif($text=~/one thing/i){
    quest::say("Well, Allix not have to have but is good. Is leaf. Ajrah leaf. Powerful magic in the leaf. Pasdar holds next to body, keeps body strong and mind clear. Not have to have but Pasdar without Ajrah Leaf is poor Pasdar. Someday Allix travel to the mighty plains of East Karana and get one from trees.");
  }
}

sub EVENT_ITEM {
 #Handin: 1x Ajrah Leaf (6349)
  if(plugin::check_handin(\%itemcount, 6349 => 1)){
    quest::say("Ajrah! Raaarrr! Ajrah Leaf! Allix destined to be mighty saiar now! Allix unsure how to thank you. Here, take this. Is my most treasured tunic.");
    quest::summonitem(1120); # Erudehide Tunic
     quest::ding(); quest::exp(25);
  }
  plugin::return_items(\%itemcount);
}


#Quest: The Luck of Allix (Submitted By: Senzo)

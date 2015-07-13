sub EVENT_SAY { 
  if($text=~/Hail/i){
   quest::say("Well met. friend.  May I be of assistance?"); 
   }
}
sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 18553 => 1)) {
     quest::say("Good $name. I am pleased to see you. You have come of age and it is time for you to register as a citizen of Shar Vahl. Your invitation indicates that the Khala Dun. defenders of our society. have noticed you and consider your potential to be worthy of our training. First. take this application to Registrar Bindarah and return to me with proof of your citizenship.");
     quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
     quest::summonitem("2873");
     }
    elsif(plugin::check_handin(\%itemcount, 2897 => 1, 2877 => 1)){
     quest::say("Allow me to be the first to welocome you to the Khala Dun. Accept this cloak, young initiate.It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Khala Dun Hebijeb and he will give you instruction.");
     quest::summonitem(2878);
     quest::summonitem(2877);
     quest::ding();
     quest::exp(500);
     quest::faction(175,1);
     quest::faction(2806,1); 
     }
    elsif(plugin::check_handin(\%itemcount,2897 => 1)){
     quest::say("This item means nothing to me by itself");
     quest::summonitem(2897);
     }
    elsif(plugin::check_handin(\%itemcount,2877 => 1)){
    quest::say("This item, by itself means nothing to me.");
    quest::summonitem(2877);
        }
    else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  }
}
#END of FILE Zone:kerraridge  ID:74367 -- High_Armsman_Trukhanah 


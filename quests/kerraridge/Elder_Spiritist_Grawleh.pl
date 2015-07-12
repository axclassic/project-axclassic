sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Greetings $name. are you one of our new recruits?"); }
     }
}
sub EVENT_ITEM { 
    if(plugin::check_handin(\%itemcount,18554 => 1)){
     quest::say("$name. welcome to the Shaman guild The Dar Khura. You have grown strong in the safety of our city and it is now time for you to register for official citizenship of Shar Vahl. I, Elder Spiritist Grawleh have granted your request of inclusion and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
     quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
     quest::summonitem("2873");
     }
   elsif(plugin::check_handin(\%itemcount,2897 => 1)){
     quest::say("This item means nothing to me by itself");
     quest::summonitem(2897);
     }
   elsif(plugin::check_handin(\%itemcount,2877 => 1)){
     quest::say("This item, by itself means nothing to me.")
     quest::summonitem(2877);
     }
   elsif(plugin::check_handin(\%itemcount, 2897 >= 1 , 2877 >= 1){
    quest::say("Allow me to be the first to welcome you to the Khati Sha. lords of the beasts. Accept this cloak. young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Animist Poren and he will give you instruction. May the spirits of the beasts guide you and keep you safe.");
    quest::summonitem(2878);
    quest::summonitem(2877);
    quest::faction(175,1);
    quest::faction(2806,1); 
    } 
    elsif($itemcount{30962} == 1){
    quest::summonitem("15225","1");
    }
    if($itemcount{18551} == 1){
    quest::summonitem("2873");
    }
    if($itemcount{2897} == 1 && $itemcount{2877} == 1){
    quest::summonitem("2877"); }
    }
    else{
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:sharvahl  ID:155167 -- Elder_Spiritist_Grawleh 


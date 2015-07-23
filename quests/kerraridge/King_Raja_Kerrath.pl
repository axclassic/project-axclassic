sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Greetings citizen... you are very brave to approach me in this manner.  That sort of bravery warrants my respect.  How may I help you?");
     }
}
sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 18299 => 1 )) {
     quest::say("Your humility and willingness to serve shall not be wasted. There is much to be done. $name. and our people thank you in advance for your selfless service.");
     quest::summonitem(18304);
     quest::ding():
     quest::exp(50);
     quest::faction(175,1);
     quest::faction(2806,1);
     }
    elsif (plugin::check_handin(\%itemcount, 6190 =>1 )) { 
     quest::shout("Citizens of Shar Vahl, your attention please! As your king is my honor to present to you a true Hero of the Shar Vahl! Give $name your complete respect and salute 'em when you see them in passing. We enjoy our freedom, because of brave citizens like $name.");
     quest::say(" And for your servicce to the crown, please accept this Cloak of the Heroes. Wear it proudly as you have earned it $name.");
     quest::summonitem(120214);
     quest::ding();
     quest::exp(100000);
     quest::faction(175,1);
     quest::faction(2806,1);
     }
   else {
    plugin::return_items(\%itemcount);
    }
}
#END of FILE Zone:sharvahl  ID:155154 -- King_Raja_Kerrath 


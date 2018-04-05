sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Why. hello there. $name. and welcome to New Tanaan. In the past. we were rarely graced with the visits of Norrath's brave adventurers. but now it seems that your presence is delivered in a most gracious and unpredicted volume. Oh but I do not complain. my friend! I am merely excited and bound in wonder at the true. underlying tale of it all -- why. something most extraordinary must be on the heels of history's most recent climax for such interest to be garnered by Norrath's worldly scholars and travelers. We of New Tanaan understand these things most well. indeed. and our guidance is extended to all should they need it. I personally am one whose affinity is that of enchantments. and any who share my niche are more than welcome to browse what spells I carry and purchase them at their will and desire.");
    }
    elsif($text=~/Clear Mana/i) {
       quest::say("I will gladly perform this service for you.  Just hand me an Emerald, a Poison Vial and 100 platinum.");
    }
}

sub EVENT_ITEM {
   if(($platinum>99) && plugin::check_handin(\%itemcount, 10029 => 1) && plugin::check_handin(\%itemcount, 16965 => 1)) {#Emerald and Poison Vial
      quest::selfcast(540); #Clarify Mana
   }
   else {
      quest::say("I don't need this."); #text made up
      plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:poknowledge  ID:202210 -- Illusionist_Acored 


sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Good day to you. $name. Despite your purpose among us in New Tanaan. know that we bear no ill will toward any for mere distinctions of race or religious preference. We are all equals -- children of the gods and children of the earth alike. It has been a very long time since I have been among adventurers. and I admit that this is truly an experience I have not craved. The nymphs were persecuted in our day. though not through intended force. but in the expansion of your cultures and the erection of great elven and human cities. Aaah. but I do dwell on matters of the past. What is done is done. Now. I exist to aid you should you wish it. friend. I have adopted the mortal art of enchantment and what knowledge I have of it is yours should it be of use.");
    }
    if($text=~/Clear Mana/i) {
        quest::say("I will gladly perform this service for you.  Just hand me an Emerald, a Poison Vial and 100 platinum.");
    }
}

sub EVENT_ITEM {
    if(($platinum>99) && plugin::check_handin(\%itemcount, 10029 => 1) && plugin::check_handin(\%itemcount, 16965 => 1)) {
        #Emerald and Poison Vial
        quest::selfcast(540); #Clarify Mana
    }
}
#END of FILE Zone:poknowledge  ID:202211 -- Illusionist_Lobaen 


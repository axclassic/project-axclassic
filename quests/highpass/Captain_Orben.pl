sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("Hi, I'm Captain Orben, and I'm in charge of the troops and [volunteers] here at the Highpass West Gate. If you'd like to help us out, I'll pay you for every [gnoll] scalp you return to me.");
    }
    if($text=~/volunteers/i) {
        quest::say("We set up this Volunteer Watch to help keep these beasts outta Highpass Hold. We get volunteers to stand watch at the gates, and pay them a small reward for every [gnoll] scalp they turn in.");
    }
    if($text=~/Volunteer Watch/i) {
        quest::say("We set up this Volunteer Watch to help keep these beasts outta Highpass Hold. We get volunteers to stand watch at the gates, and pay them a small reward for every [gnoll] scalp they turn in.");
    }
    if($text=~/gnoll/i) {
        quest::say("Well, these [gnolls] keep sending small raiding parties into Highpass. Thanks to the [Volunteer Watch] and myself, they never get past these gates. Sure keeps us busy, though.");
    }
    if($text=~/gnolls/i) {
        quest::say("Well, these [gnolls] keep sending small raiding parties into Highpass. Thanks to the [Volunteer Watch] and myself, they never get past these gates. Sure keeps us busy, though.");
    }
}

sub EVENT_ITEM {
    if($itemcount{13792} == 1) {
        quest::givecash(6,7,2,0);
        quest::faction(149,5);
        quest::faction(31,2);
        quest::faction(214,2);
        quest::faction(53,2);
        quest::faction(105,2);
        quest::exp(1000);
    }
}
#END of FILE Zone:highpass  ID:5036 -- Captain_Orben 

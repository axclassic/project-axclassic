## #Yuisaha (317115) ##

sub EVENT_SPAWN {
    quest::ze(15, "A great thundering voice booms across the land like a thunderstorm breaking. 'I am Yuisaha, spirit of rain and storms. You have endured much to free me. I thank you for rescuing and reviving me. Take this, a small portion of my essence. May it aid you, and may none forget the great deed you have done.'");
    quest::settimer("depop", 20);
}

sub EVENT_TIMER {
    if($timer eq "depop") {
        quest::depop();
    }
}


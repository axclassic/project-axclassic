## #Yuisaha (317115) ##

sub EVENT_SPAWN {
    quest::shout("I am Yuisaha, spirit of rain and storms.");
    quest::ze(13, "A great thundering voice booms across the land like a thunderstorm breaking.");
    quest::shout("You have endured much to free me. I thank you for rescuing and reviving me. Take this, a small portion of my essence. May it aid you, and may none forget the great deed you have done.");
    quest::settimer("depop", 15);
}

sub EVENT_TIMER {
    if($timer eq "depop") {
        quest::depop();
    }
}


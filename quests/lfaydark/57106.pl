# #Kahliz_the_Mist_Runner (57106)

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::emote("The mist that makes up its shape then begins to dissipate.");
        quest::depop()
    }
}


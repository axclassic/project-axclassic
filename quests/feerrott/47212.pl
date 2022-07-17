# #Yehan_the_Weaver (47212)

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::emote("seems to make a quick appraisal of you before fading from your sight.");
        quest::depop()
    }
}

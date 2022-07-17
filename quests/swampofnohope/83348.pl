# #Hericol_the_Lurker (83348)

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::emote("'s form turns to water and slowly begins to melt away.");
        quest::depop();
    }
}


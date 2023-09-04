sub EVENT_ITEM {
    #Handin: Globe of Discordant Energy & Fistwraps of Celestial Discipline
    if(plugin::check_handin(\%itemcount, 47100 => 1, 61025 => 1)) {
        #Monk Epic 2.0 [End]
        quest::say("I see you have found a way to bring order and balance back to the world. You should have also learned of the need for such evils in the world. There cannot be good without evil just as there cannot be truth without deception. I will take the discordant globe now with your fistwraps and make something wonderful for you from them. They will help guide you through the most difficult of times as a reminder of the knowledge you now possess for without the balance between good and evil we are but lost.");
        #Summon: Transcended Fistwraps of Immortality
        quest::summonitem(67742);
    }
    else {
        my $stuff = (\%itemcount);
        my $yes = 2;
        foreach my $k (keys(%{$stuff})) {
            next if($k == 0);
            $yes = 1;
        }
        if($yes == 1) {
            quest::say("I don't need this $name. Take it back.");
            plugin::return_items(\%itemcount);
        }
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::say("Thanks for the coin!");
        }
    }
}
#End of File
sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("It is a pleasure to meet you. but I do not have time to speak.  I am waiting on official word from Kerra Ridge.  If you have been sent to assist me. please show me the Official Seal of the Khati Sha at this time.  If you are not such a person. please carry on with your business and leave me to tend to mine.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 9031 => 1)) {
        quest::say("Keep your head down, mate! The spirit that you have come for is very close. I have spotted it several times today. It keeps appearing near that odd structure just over the hill. Be careful not to attract the attention of those invisible creatures that roam near the structure. Just release the spirit and return the totem to me. I'll prepare the totem for placement in the container that you were given.");
        quest::emote("The air before the large monolith grows solid, as misty tendrils wrap together in the shape of a large wolf.");
        quest::spawn(57119,0,0,-1675,-337,0);
    }
    elsif(plugin::check_handin(\%itemcount, 9034 => 1)) {
        quest::emote("wraps the totem and returns it with the seal you gave him");
        quest::say("That spirit was very powerful. I'm glad that you were able to release it. Please keep this totem safe until you can return to Kerra Ridge. Once you collect all of the totems, seal the box and return it to your master. May the spirits watch over you!");
        quest::summonitem(9031);
        quest::summonitem(9035);
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
#END of FILE Zone:lfaydark  ID:5796 -- Scout_Rahjiq

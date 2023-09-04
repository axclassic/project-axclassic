#Onirelin_Gali.pl
#Willamina's Needles


sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::emote("peers you over carefully, studying you.  'Welcome and come in, stranger.  Are you here to simply look around or have you come to speak to my superior, Gunyth?  If so, you may find him upstairs. Watch your step, now.'");
    }
    if($text=~/artifact/i) {
        quest::emote("pauses for a moment and continues, 'I am aware of that which Cador desires. Be wary of his ways for they are not always as they appear. Nevertheless, if he thinks this artifact will bring him greater peace, he may have it for a price. Certainly I have no use for it but what do I get in return? I'll tell you. Narik and I used to be good friends, until he became jealous of my relationship with his former companion Elisha. During our fight, he marched off with one of my finest jewels, and I believe still has it. Find him and ask for my jewel back. If you bring it to me, Cador may get want he wants as well.'");
    }
}


sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 28088 => 1)) {
        #Onirelin's Jewel
        quest::say("How did you get this away from Narik? Oh never mind, I'm just happy to have it back. I shall give you what Cador desires now, keep it secure and deliver it to him.");
        quest::summonitem(28089);#Cador's Artifact
        quest::ding(); quest::exp(250);
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
}#END of FILE Zone:poknowledge  ID:202041 -- Onirelin_Gali 


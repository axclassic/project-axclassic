######################
## Edited responses ##
##    By Aardil     ##
##   11-24-2013     ##
######################
sub EVENT_SAY
{
    if ($text=~/Lucan/i) {
        quest::say("That man is no just ruler. He has jailed me and my friend Zimel for merely begging.");
    }
    if ($text=~/Hail/i) {
        quest::say("Do you have any spare coppers for a thirsty soul?");
    }
    if ($text=~/Zimel/i) {
        quest::say("What?! You know my friend Zimel?! I would like to speak of him, but my mouth is so parched. Maybe a fine grog would loosen my lips. I am uncertain which flavor shall do the trick.");
    }
}

my $DromCounter;
sub EVENT_ITEM
{
    if($DromCounter >= 4) {
        quest::say("Ahh!! That was good. Now where were we?. Oh yes, My friend Zimel is a fellow beggar. He was locked up in the arena. They were going to let him go when the Freeport Militia came for him. Ha!! He is crazy as a troll now. I took this blanket from his cell before I was released. I no longer need it and my guilt has reached its peak. I do not want crazy old Zimel to freeze. Perhaps you can return it to him.");
        #Summon Bunker Cell #1 (Zimel's Blanket) ID: 12196
        quest::summonitem(12196);
        $DromCounter = undef;
    }
    #Check for 1 Drom's Champagne ID: 13829
    if(plugin::check_handin(\%itemcount, 13829 => 1)) {
        if($DromCounter) {
            $DromCounter++
        }
        else {
            $DromCounter = 1;
        }
        quest::say("Oooh!! That is the taste. My lips are almost loose. Maybe another will do the trick.");
    }
    if(plugin::check_handin(\%itemcount, 13829 => 4)) {
        quest::say("Ahh!! That was good. Now where were we?. Oh yes, My friend Zimel is a fellow beggar. He was locked up in the arena. They were going to let him go when the Freeport Militia came for him. Ha!! He is crazy as a troll now. I took this blanket from his cell before I was released. I no longer need it and my guilt has reached its peak. I do not want crazy old Zimel to freeze. Perhaps you can return it to him.");
        #Summon Bunker Cell #1 (Zimel's Blanket) ID: 12196
        quest::summonitem(12196);
        $DromCounter = undef;
    }
    quest::plugin_returnitems(\%itemcount);
}

sub EVENT_SIGNAL {
    if ($signal == 2) {
        quest::say("That man is no just ruler. He has jailed me and my friend Zimel for merely begging.");
    }
}

#END if FILE Zone:freporte ID:10157 -- Tykar_Renlin

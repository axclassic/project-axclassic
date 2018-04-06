#BeginFile: nro\Magus_Arindri.pl
#
#

sub EVENT_SAY {
    if($ulevel >= 15) {
        if(plugin::check_hasitem($client, 41000) || $client->KeyRingCheck(41000)) {
            #Adventurer's Stone
            if($ulevel<45) {
                # Low levels need to use Moonstones
                if($text=~/hail/i) {
                    my $random_result = int(rand(100));
                    if($random_result<=45) {
                        quest::say("I hear that you use Moonstones for travel around here.");
                    }
                    elsif($random_result<=60) {
                        quest::say("I can hear the sound of the Ocean from here, can you?");
                    }
                    elsif($random_result<=85) {
                        quest::say("Whelp, here comes another goblin.");
                    }
                    else {
                        quest::say("I hear that you use Moonstones for travel around here.");
                    }
                }
                else {
                    quest::say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it. Perhaps you should talk to another at this camp to see if they have any use for you.");
                }
            }
            else {
                if($text=~/hail/i) {
                    quest::say("You endured the burning heat of the desert to come and use our magic!  I'm so excited.  We have been getting a lot of customers.  We've only lost a few.  I sometimes wonder if Vayzl has incorrectly used the spell on purpose to see the odd traveler explode into a spray of magic.  I do respect her, but I just don't understand dark elves, I guess.  I am far too precise and careful to make any mistakes... Well, not a second time.  Tell me where you would like to go and I will send you there.  I can send you to any of the other camps in [Everfrost], [Commonlands], [Nedaria's Landing], [South Ro], or [Butcherblock Mountains].");
                }
                elsif($text=~/everfrost/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4180); #Teleport Everfrost
                }
                elsif($text=~/commonlands/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4176); #Teleport East Commons
                }
                elsif($text=~/nedaria/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4580); #Teleport Nedaria
                }
                elsif($text=~/butcherblock/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4179); #Teleport Butcherblock Mountains
                }
                elsif($text=~/south ro/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4178); #Teleport South Ro
                }
            }
        }
        else {
            #PC has not done the Adventurer's Stone Quest yet.
            quest::say("You will have to excuse me, I am quite busy."); #Text made up
        }
    }
    else {
        #PC is not at appropriate level yet
        quest::say("You will have to excuse me, I am quite busy."); #Text made up
    }
}

sub EVENT_ITEM {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
}

#EndFile: nro\Magus_Arindri.pl

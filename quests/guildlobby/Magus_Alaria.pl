#BeginFile: guildlobby\Magus_Alaria.pl
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
                    quest::say("Greetings, $name. As you may have guessed I have been sent here by the Wayfarers Brotherhood to assist those that dare subject themselves to our magic. I promise you I have trained long and hard to be up to the task.  I only rarely make the type of mistakes you may have heard about regarding these spells of travel. Come, let me know where you would like to go and I'll send you on your way.  I can send you to any of the Wayfarer camps in [Butcherblock Mountains], [Commonlands], [Everfrost], [North Ro], [South Ro], or [Nedaria's Landing].");
                }
                elsif($text=~/butcherblock/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4179); #Teleport Butcherblock Mountains
                }
                elsif($text=~/commonlands/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4176); #Teleport East Commons
                }
                elsif($text=~/everfrost/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4180); #Teleport Everfrost
                }
                elsif($text=~/north ro/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4177); #Teleport North Ro
                }
                elsif($text=~/south ro/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4178); #Teleport South Ro
                }
                elsif($text=~/nedaria/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4580); #Teleport Nedaria
                }
            }
        }
        else {
            #PC has not done the Adventurer's Stone Quest yet.
            if($text=~/hail/i) {
                quest::say("Greetings, $name. As you may have guessed I have been sent here by the Wayfarers Brotherhood to assist those that dare subject themselves to our magic. Without the Adventurer's Stone I can only offer transport to [Nedaria's Landing].");
            }
            elsif($text=~/nedaria/i) {
                quest::emote("begins to cast a spell.");
                quest::selfcast(4580); #Teleport Nedaria
            }
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

#EndFile: guildlobby\Magus_Alaria.pl

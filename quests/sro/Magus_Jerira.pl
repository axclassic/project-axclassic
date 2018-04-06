#BeginFile: sro\Magus_Jerira.pl
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
                    quest::say("Nice to see you, $name.  Am I safe in assuming you wish to travel today?  I do admire the adventurers that so willingly take the risk involved with this spell.  I enjoy knowing all of my hard work is not in vain.  There's only been a few unfortunate folk that haven't, uhm, been so lucky.  Frightful mess.  I'll be sure to be extra careful where you are concerned.  Honestly.  A dark elf's word is... Well, forget that.  He he.  Tell me where you would like to go and I will send you there.  I can send you to any of the other camps in [Everfrost], [Commonlands], [Nedaria's Landing], [North Ro], or [Butcherblock Mountains].");
                }
                elsif($text=~/north ro/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4177); #Teleport North Ro
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
                elsif($text=~/everfrost/i) {
                    quest::emote("begins to cast a spell.");
                    quest::selfcast(4180); #Teleport Everfrost
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

#EndFile: sro\Magus_Jerira.pl

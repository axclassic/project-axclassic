##################################################
## NPC: Champion Darkwater                      ##
## Zone: All Starter Towns                      ##
## Darkwater Ladder Event                       ##
## By: Angelox	                                ##
## Revised Clicklinks by Caved                  ##
## 3rd rev by Angelox logic 2/01/11             ##
## 7/29/15 4th REV patrikpatrik                 ##
## 7/31/15 improved globals                     ##
## 1/01/16 SoW Earring gift                     ##
## 2/02/16 More rewards at level 65             ##
## 1/01/17 added shrink item reward             ##
## 6/30/17 update                               ##
## 10/1/17 Changed 22298 to 22294               ##
## 12/31/19 Changed yr to 2020                  ##
## 7/1/20 July 1st update                       ##
## 12/31/20 Jan 1st update	                    ##
## 07/01/21 Jul 1st update                      ##
## 08/24/21 PvP to Ladder by Congdar            ##
## 09/04/21 Changes to starter gifts by Angelox ##
##                                              ##
## Special ladder restart for Oct 1st 2021 see  ##
## below for extra comments - patrikpatrik      ##
## 10/03/2021 Added arrays - Angelox            ##
## 12/15/2021 Added 'Ring of the Shadows'       ##
## starter item #120342 created by Angelox      ##
##################################################

    # NOTE: ---------------------  #
    # Darkwater Script has exceptions to previous players to continue
    # playing until December 31st. Normal reset procedures starts at
    # cutoff charid = 8127 Therefore any id's before this MUST have
    # been added as an exception ($ladder == 1) in char_.blob column
    # Don't forget to restore back to usual on Januart 1st etc...!
    # Last updated September 30, 2021 - patrikpatrik
    # make global since used in EVENT_SAY and also EVENT_ITEM
    ##Kept these so we know who is in the array
    #my $mrdoak    = 8088; # (50)
    #my $meek      = 8090; # (14)
    #my $dozer     = 8118; # (13)
    #my $holder    = 8117; # (10)
    #my $flashback = 8121; # (3)
    # --- End of Exception List --- #

sub EVENT_SAY {
    # This array can be used in every ladder season, 
    # As one of the forum posts said they would like more time -so if they are low level,
    # We can add them to this array (remove the older one when season is over)
    # Add exeptions in this array
    #Also add to array in EVENT_ITEM
    my @playerID = (8088,8090,8118,8117,8121);
    my $FoundPlayer = 0;
        foreach (@playerID) {
            /$charid/ and $FoundPlayer = 1;
        }
    #hyperlinks
    my $reward = quest::saylink("reward", 1);
    my $title = quest::saylink("title", 1);
    my $items = quest::saylink("items", 1);
    my $moonstones = quest::saylink("moonstones", 1);
    my $possession = quest::saylink("possession", 1);
    my $prove = quest::saylink("prove", 1);
    my $first = quest::saylink("first", 1);
    my $second = quest::saylink("second", 1);
    my $newyears = quest::saylink("special", 1);
    my $agree = quest::saylink("agree", 1);
    #Ladder date and char settings
    #RATHEUSA
    $ActiveServer = 1;
    my $minCharID  = 8455; # Dont forget lines @ 255 260 for EVENT_ITEM
    my $maxCharID  = 8454; # one less
    
    if($ActiveServer == 2) {
        #RATHEUK
        $minCharID  = 1;
        $maxCharID  = 0;
    }
    elsif($ActiveServer == 3) {
        #NOSERVER
        $minCharID  = 20000;
        $maxCharID  = 20000;
    }

    my $activeYear = 2023; #2021 2022
    my $activeMonth = "January"; #July January October

    if(($text=~/server/i) && ($ActiveServer == 1)) {
        $client->Message(14, "Champion Darkwater says, 'This is Rathe USA Server'");
    }
    elsif(($text=~/server/i) && ($ActiveServer == 2)) {
        $client->Message(14, "Champion Darkwater says, 'This is Rathe UK Server'");
    }
    elsif($text=~/server/i) {
        $client->Message(14, "Champion Darkwater says, 'There's no ladder on this server'");
    }
    if(($text=~/hail/i) && ($status == 10)) {
        #Players banned from ladder
        $client->Message(14, "Champion Darkwater says, 'Your account has been removed from the ladder, contact a GM for help.'");
        quest::ladder("off");
        return;
    }
    elsif(($text=~/hail/i) && ($status > 10) && ($status != 255)) {
        #Only developement status 255 allowed 
        $client->Message(14, "Champion Darkwater says, 'Your accounts status does not allow you to play on the ladder.'");
        quest::ladder("off");
        return;
    }
    #elsif(($text=~/hail/i) && ($charid < $minCharID)) {
    elsif(($text=~/hail/i) && ( ($charid < $minCharID) && ($FoundPlayer != 1))) {
        #this is the newest charID
        $client->Message(14, "Champion Darkwater says, 'Your character is too old for this ladder, start a new character!'");
        $client->Message(15, "This ladder began on $activeMonth 1st, $activeYear, check AX Classic forums.");
        $client->Message(15, "You should start a new character today for The Ladder.");
        quest::ladder("off");
    }
    elsif(($text=~/hail/i) && (($charid > $maxCharID) || ($FoundPlayer == 1)) && (!defined $qglobals{"ladder_trophy"}) && (!defined $qglobals{"ladder_title"})) {
        $client->Message(14, "Champion Darkwater says, 'Hail, $name! I am Champion Darkwater the Ladder Guide, and I will be observing and rewarding you for your advancement on the Ladder.'");
        $client->Message(14, "Champion Darkwater says, 'I will $reward you for your advancement at 20, 35, 45, 55, and 65. When you reach 65, ask me for your $title, and I will provide it for you, in addition to your reward.'");
        $client->Message(14, "Champion Darkwater says, 'Warning: The Ladder is for Seasoned Players. This typically means you are not the main character but an alternate or secondary or thirdary etc. The Ladder is not for new players but you can join the Ladder if you want.");
        $client->Message(14, "Champion Darkwater says, 'Do you $agree to join the Ladder?'");
        #$client->Message(14, "ulevel is $ulevel");
        #$client->Message(14, "isladderplayer() is quest::isladderplayer()");
        #$client->Message(14, "ulevel is $ulevel");
    }
    elsif(($text=~/agree/i) && (quest::isladderplayer() != 1) && ($ulevel == 1)) {
        #$client->Message(14, "isladderplayer() is quest::isladderplayer() and ulevel==1");
        quest::setglobal("ladder_trophy", 1, 5, "F");
        quest::setglobal("ladder_title", 1, 5, "F");
        quest::ladder("on");
        #$client->Message(15, "Your qglobal and ladder number is $ladder_trophy and $ladder_title."); #debugging
        #$client->Message(14, "Champion Darkwater says, 'Welcome $name to the Rathe Ladder! Here is your earring.");
        #$client->Message(6, "You received a Darkwater's Gift!");
        $client->Message(14, "Champion Darkwater says, 'Welcome $name to the Rathe Ladder. Here are some jewelry to get you started, Good luck!");
        $client->Message(6, "You receive Ring of the Shadows and a Darkwater's Gift!");
        quest::summonitem(119924);
        quest::summonitem(120342);
        quest::ding();
    }
    elsif(($text=~/agree/i) && (quest::isladderplayer() != 1) && ($ulevel != 1)) {
        #$client->Message(14, "isladderplayer() and ulevel != 1");
        $client->Message(14, "Champion Darkwater says, 'You are not eligible for The Ladder.'");
        quest::ladder("off");
        #$client->Message(15, "Your qglobal and ladder number is $ladder_trophy and $ladder_title."); #debugging
    }
    elsif(($text=~/hail/i) && (($charid > $maxCharID) || ($FoundPlayer == 1)) && (defined $qglobals{"ladder_trophy"})) {
        #charid must be greater than X
        $client->Message(14, "Champion Darkwater says, 'Welcome back, $name!'");
        $client->Message(14, "Champion Darkwater says, 'I will $reward you for your advancement at 20, 35, 45, 55, and 65. When you reach 65, ask me for your $title, and I will provide it for you, in addition to your reward.'");
        #$client->Message(15, "Your qglobal and ladder number is $ladder_trophy and $ladder_title."); #debugging
    }
    #Rewards
    elsif(($text=~/reward/i) && (defined $qglobals{"ladder_trophy"})) {
        if($ulevel < '20') {
            $client->Message(14, "Champion Darkwater says, 'Come back when you have acquired the needed level.'");
        }
        elsif($ulevel < '35' && ($ladder_trophy < '2')) {
            #set 1st trophy
            $client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
            quest::summonitem(409);
            quest::exp(50);
            quest::ding();
            $client->Message(6, "You received the Ladder Players Trophy!");
            $client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession that can help you with your travels.'");
            quest::setglobal("ladder_trophy", 2, 5, "F");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '35') && ($ladder_trophy == '2')) {
            $client->Message(15, "You already have your level 20 trophy.");
            $client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession that can help you with your travels.'");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '45') && ($ladder_trophy < '3')) {
            #set 2nd trophy
            $client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
            quest::summonitem(410);
            quest::exp(50);
            quest::ding();
            $client->Message(6, "You received the Dedicated Ladder Players Trophy!");
            quest::setglobal("ladder_trophy", 3, 5, "F");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '45') && ($ladder_trophy == '3')) {
            $client->Message(15, "You already have your level 35 trophy.");
            $client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession that can help you with your travels.'");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '55') && ($ladder_trophy < '4')) {
            #set 3rd trophy
            $client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
            quest::summonitem(411);
            quest::exp(50);
            quest::ding();
            $client->Message(6, "You received the Advanced Ladder Players Trophy!");
            quest::setglobal("ladder_trophy", 4, 5, "F");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '55') && ($ladder_trophy == '4')) {
            if($ulevel < '53') {
                #This is last check forunder level 53 with items
                $client->Message(15, "You already have your level 45 trophy.");
                $client->Message(14, "Champion Darkwater says, 'Do you still travel by ship? I have $items in my possession that can help with your travels.'");
            }
            else {
                $client->Message(15, "Champion Darkwater says, 'You already have your level 45 trophy.'");
            }
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '65') && ($ladder_trophy < '5')) {
            #set 4th trophy
            $client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your trophy.'");
            quest::summonitem(412);
            quest::exp(50);
            quest::ding();
            $client->Message(6, "You received the Master's Ladder Players Trophy!");
            quest::setglobal("ladder_trophy", 5, 5, "F");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '65') && ($ladder_trophy == '5')) {
            $client->Message(15, "You already have your level 55 trophy.");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '66') && ($ladder_trophy < '6')) {
            #set 5th trophy
            $client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your final trophy.'");
            quest::summonitem(413);
            quest::exp(50);
            quest::ding();
            $client->Message(6, "You received the Champion's Ladder Players Trophy!");
            quest::setglobal("ladder_trophy", 6, 5, "F");
            $client->Message(14, "Champion Darkwater says, 'I will give you something more $name, all you need to do is show me the final trophy.'");
            if(!quest::isladderplayer()) {
                quest::ladder("on");
            }
        }
        elsif(($ulevel < '66') && ($ladder_trophy == '6')) {
            $client->Message(15, "You already have your level 65 trophy.");
        }
    }
    #Ladder Title
    elsif(($text=~/title/i) && (defined $qglobals{"ladder_title"})) {
        if($ulevel < '65') {
            $client->Message(14, "Champion Darkwater says, 'I'm sorry but you are not eligible for the Ladder Title at this time.'");
        }
        elsif(($ulevel == '65') && ($ladder_title == '1')) {
            #set Ladder Title
            ##$client->SetAATitle("Ladder Champion"); changed to quest::enabletitle() 08/01/2021 by Congdar
            quest::enabletitle(3);
            ##quest::we is bugged
            ##quest::we(13, "Champion Darkwater shouts, 'All Hail $name for earning the title Ladder Champion!'");
            quest::ding();
            quest::setglobal("ladder_title", 2, 5, "F");
            quest::ladder("off");
            $ladder_title=undef;
        }
        elsif(($ulevel == '65') && ($ladder_title == '2')) {
            if(quest::checktitle(3)) {
                $client->Message(15, "You already received your Ladder Title.");
            }
            else {
                quest::enabletitle(3);
            }
            #quest::setglobal("ladder_trophy", 0, 4, "F"); #For resets
            #quest::setglobal("ladder_title", 0, 4, "F");  #For resets
            #$client->Message(15, "Your qglobal and ladder number is $ladder_trophy and $ladder_title."); #debugging
        }
    }
    #End Rewards
    #Moonstone Quests
    elsif($text=~/items/i) {
        $client->Message(14, "Champion Darkwater says, 'While fighting evil in Norrath, I have found the legendary $moonstones on certain kills.'");
    }
    elsif($text=~/moonstone/i) {
        $client->Message(14, "Champion Darkwater says, 'With the magic of a Moonstone in your $possession, you will be able to travel to the land where it was formed.'");
    }
    elsif($text=~/possession/i) {
        $client->Message(14, "Champion Darkwater says, 'I have many of these Moonstones, I would give one to anybody who can $prove their worthiness and determination to me.'");
    }
    elsif($text=~/prove/i) {
        $client->Message(14, "Champion Darkwater says, 'I have two quests for you, the $first quest is for Moonstones in Antonica, Odus, Faydwer, and Kunark. The $second is for the Moonstone of the Ice.'");
    }
    elsif($text=~/first/i) {
        if(($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') | ($race eq 'Gnome')) {
            #Fayder
            $client->Message(14,"Champion Darkwater says, 'Go to Dagnor's Cauldron in Butcher Block, and bring me the proof I want: bring me the Water Ring from an aqua goblin.'");
        }
        elsif(($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') | ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')) {
            #Antonica
            $client->Message(14,"Champion Darkwater says, 'Go to Rathe Mountains in Antonica, and bring me the proof I want: bring me Bone Barbs from a barbed bone skeleton.'");
        }
        elsif(($race eq 'Iksar') | ($race eq 'Froglok')) {
            #Kunark
            $client->Message(14,"Champion Darkwater says, 'Go to the Lake of Ill Omen in Kunark, and bring me the proof I want: bring me a Tattooed Sarnak Head  from a Sarnak legionnaire.'");
        }
        elsif(($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') | ($race eq 'Dark Elf')) {
            #Odus
            $client->Message(14,"Champion Darkwater says, 'Go to Erud's Crossing in Odus, and bring me the proof I want: bring me the tool kit from a frantic kerran.'");
        }
    }
    elsif($text=~/second/i) {
        if(($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') | ($race eq 'Gnome')) {
            #Fayder
            $client->Message(14,"Champion Darkwater says, 'Go to the Castle Mistmoore in Lesser Faydark, and bring me the proof I want: bring me the blood from a Fallen Noble.'");
        }
        elsif (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') | ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')) {
            #Antonica
            $client->Message(14,"Champion Darkwater says, 'Go to the Accursed Temple of Cazic-Thule in the Feerrott, and bring me the proof I want: bring me a Mosquito Earring from The Infected Mosquito.'");
        }
        elsif (($race eq 'Iksar') | ($race eq 'Froglok')) {
            #Kunark
            $client->Message(14,"Champion Darkwater says, 'Go to the Crypt of Dalnir in Warsliks Woods, and bring me the proof I want: bring me the Battle Plans from a kly evoker.'");
        } 
        elsif (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') | ($race eq 'Dark Elf')) {
            #Odus
            $client->Message(14,"Champion Darkwater says, 'Go to Stonebrunt Mountains in Odus, and bring me the proof I want: bring me a Leopard Fang from a kejek leopard.'");
        }
    }
    #End Moonstone

    #Angelox's New Year's reward SoW Earring only when Event1 is ON
    if(($text=~/hail/i) && ($event1 == 1)  && ($ulevel > 1) && ((!defined $qglobals{"newyears"}) || ($qglobals{"newyears"} == 0))) {
        $client->Message(14,"Champion Darkwater says, 'Is it New Years already? Well, Happy New Year $name! Here, take my $newyears reward for your dedication.");
        quest::setglobal("newyears", 1, 5, "F");
    }
    elsif(($text=~/special/i) && ($event1 == 1)  && ($ulevel > 1) && ($qglobals{'newyears'} == 1)) {
        quest::summonitem(625);
        quest::ding();
        $client->Message(6,"You received Darkwater's earring of travel!");
        quest::setglobal("newyears", 2, 5, "F");
    }
    elsif(($text=~/hail/i) && ($event1 == 1)  && ($ulevel > 1) && ($qglobals{"newyears"} == 2)) {
        $client->Message(14, "Champion Darkwater says, 'Happy New Year $name. Glad to see you again!");
        # $client->Message(14, "debugging, newyears is $newyears, or qglobals is $qglobals{'newyears'}");
    }
    elsif(($text=~/hail/i) && ($event1 != 1)) {
        # $client->Message(15, "Okay trying to make event1 undefined or at least start New years again!");
        quest::setglobal("newyears", 0, 5, "F");
    }
    #End New Year's reward SoW Earring
}

sub EVENT_ITEM {
    # Add exeptions in this array
    my @playerID = (8088,8090,8118,8117,8121);
    my $FoundPlayer = 0;
        foreach (@playerID) {
            /$charid/ and $FoundPlayer = 1;
        }
    if($ActiveServer == 1) {
        #RATHEUSA
        $minCharID = 8455; # 8360
    }
    elsif($ActiveServer == 2) {
        #RATHEUK
        $minCharID = 1;
    }
    my $activeMonth = "January";
    my $activeYear = 2023;
    # if($charid < $minCharID) { // special oct 1st edit @ line 313 here as well!
    if(($charid < $minCharID) && ($FoundPlayer != 1)) {
        #this charid and the one above should be the same.
        $client->Message(14, "Champion Darkwater says, 'Your character is too old for this ladder, start a new character!'");
        $client->Message(15, "This ladder began on $activeMonth 1st, $activeYear, check AX Classic forums.");
        $client->Message(15, "You should start a new character on or after this date.");
        quest::ladder("off");
        #$client->Message(14, "charid is $charid and mincharid is $minCharID.");
        plugin::return_items(\%itemcount);
        if($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
        }
    }
    # money check
    elsif($platinum != 0 || $gold != 0 || $silver != 0 || $copper != 0) {
        $client->Message(14, "Champion Darkwater says, 'Ermmm... well okay thanks.'");
    }
    #Champion Darkwater's gift
#     elsif(plugin::check_handin(\%itemcount, 119925=>1)) {
#         $client->Message(14, "Champion Darkwater says, 'Welcome $name to the Rathe Ladder! Here is your earring.");
#         $client->Message(6, "You received a Darkwater's Gift!");
#         quest::summonitem(119924);
#         quest::ding();
#     }
    # Bone Barbs, Water Ring (both types),Sarnak Head,Tool Kit
    elsif((plugin::check_handin(\%itemcount, 19037 =>1)) | (plugin::check_handin(\%itemcount, 69246 => 1)) | (plugin::check_handin(\%itemcount, 10546 => 1)) | (plugin::check_handin(\%itemcount, 12911 => 1)) | (plugin::check_handin(\%itemcount, 17057 => 1))) {
        $client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your Moonstone.'");
        $client->Message(6, "You received Moonstone of the Commons!");
        quest::summonitem(126);
        quest::exp(50);
        quest::ding();
    }
    # Noble's Blood, Dalnir Battle Plans,Leopard Fang, Skeeter Earring
    elsif((plugin::check_handin(\%itemcount, 1890 => 1)) | (plugin::check_handin(\%itemcount, 48058 => 1)) | (plugin::check_handin(\%itemcount, 6944 => 1)) | (plugin::check_handin(\%itemcount, 604 => 1))) {
        $client->Message(14, "Champion Darkwater says, 'Well done $name! Here is your Moonstone.'");
        $client->Message(6, "You received Moonstone of Ice!");
        quest::summonitem(133);
        quest::exp(50);
        quest::ding();
    }
    #Turning in 65 ladder reward for King Card
    elsif(plugin::check_handin(\%itemcount, 413=>1) && $qglobals{"kingcard"} != 1) {
        $client->Message(14, "Champion Darkwater says, 'I see you want more $name. Talk to Champion Lightwater and give her this card and your random ticket.'");
        $client->Message(6, "You received a begging Card."); # changed from king card to Beggar card.
        quest::summonitem(22294); # previously 22298
        quest::summonitem(413);
        quest::setglobal("kingcard", 1, 5, "F");
        quest::ladder("off");
        #Random ticket reward
        $ticket = int(rand(4) + 1);
        if($ticket == 1) {
            quest::summonitem(51859); #green ticket
        }
        elsif($ticket == 2) {
            quest::summonitem(51860); #yellow
        }
        elsif($ticket == 3) {
            quest::summonitem(51861); #white
        }
        elsif($ticket == 4) {
            quest::summonitem(66615); #gold
        }
    }
    else {
        $client->Message(14,"Champion Darkwater says, 'Now what would I do with this?'");
        plugin::return_items(\%itemcount); #returns item
        #$client->Message(14, "kingcard is $kingcard.");
    }
}
#END OF FILE Zone:Starter Cities ID:54286 -- #Champion_Darkwater.pl


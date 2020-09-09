# Sir_Artanis (9188)
# Phylactory will get you nowhere
# Created by Gonner

sub EVENT_SAY {
    if($text=~/received your summons/i) {
        quest::say("Yes $name, thank you for responding with such haste. The Knights of Marr recently captured a Teir'Dal wizard who under intense questioning revealed a variety of disturbing matters. First, he worships Solusek Ro, which is no crime, but considering the nearby temple's past associations with the Burning Dead, specifically Marnek about whom you recently delivered revelations, then his other information seems even more dire. Secondly, he has admitted that he was in Freeport attempting to contact the leaders of the Dismal Rage for he understood that they have nearly completed a phylactery, a device that holds the mortal soul of a lich. In light of this, we ask that you visit the Oracle of K'Arnon in the Ocean of Tears to learn whatever you can about the nature of these phylacteries, including the means to create one so that we better know how to destroy them. This letter will serve as proof that you come in the name of the Knights of Marr.");
        quest::summonitem(55274);#Letter for the Oracle
    }
    if($text=~/befallen/i) {
        quest::say("You did well to ride swiftly with this news. I must take this directly to Valeron Dushire. If you learn more about this plot that would unleash this monster upon Norrath or wish to someday soon aid the Knights of Truth in putting down this evil, then return to speak to me again at a later time.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 31492 => 1)) {
        quests::say("It was a fine and valiant steed to serve its master beyond the grave, but it looks to be near its end. But I have a fine eye for horses, and I dare say it will serve you one more time.");
        quest::summonitem(31496); # Item: Bridle of Sir Ariam
        quest::Ding();
        quest::faction(184,1); # Faction: Knights of Truth
        quest::faction(86,-3); # Faction: Dismal Rage
        quest::faction(105,-3); # Faction: Freeport Militia
        quest::faction(258,1); # Faction: Priests of Marr
        quest::faction(311,1); # Faction: Steel Warriors
        quest::exp(6400);
    }
    elsif(plugin::check_handin(\%itemcount, 18474 => 1)) {
        quests::say("By Marr, what is this? .. Burning Dead .. .. Marnek! By my blade this must be stopped! Where did you find this?");
        quest::Ding();
        quest::faction(184,1); # Faction: Knights of Truth
        quest::faction(86,-3); # Faction: Dismal Rage
        quest::faction(105,-3); # Faction: Freeport Militia
        quest::faction(258,1); # Faction: Priests of Marr
        quest::faction(311,1); # Faction: Steel Warriors
        $client->AddMoneyToPP(0,0,6,10,1);
    }
    else {
        plugin::return_items(\%itemcount);
    }
}
# END of FILE Zone:freportw  ID:9188 -- Sir_Artanis.pl

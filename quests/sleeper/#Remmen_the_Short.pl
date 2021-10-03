##Remmen_the Short ID 128030 ##

sub EVENT_SAY {
    my $forsaken = quest::saylink("forsaken", 1);
    my $guardians = quest::saylink("guardians", 1);
    my $abuse = quest::saylink("abuse", 1);
    my $war = quest::saylink("war", 1);
    my $tunnels = quest::saylink("tunnels", 1);
    my $text2 = quest::saylink("chaos", 1);
    my $motives = quest::saylink("motives", 1);
    if($text=~/hail/i && defined($Sleeperawake)) {
        quest::say("You have returned, and again, I salute your effort. However, mortal being, Things have changed in this $forsaken place. You have been deemed a threat to the Claws of Veeshan for releasing Kerafyrm.");
        quest::say("Since you seem to have no values other than self riches, The pride has improved the creatures of this lair in hopes you will see the light.");
    }
    elsif($text=~/guardians/i && !defined($Sleeperawake)) {
        quest::say("The gargoyles and the golems you have seen so far are the most basic of all the creations in this tomb. However beyond this hall you will find creatures of even greater spite and power. Beyond this hall you will begin to understand the immensity of the situation which you are in,as well as the control that the Ancients have on those who enter this liar. If I were in your position, I would turn back and leave the liar before chaos erupted into my very essence, as it is sure to do in yours and as it has in many before you.");
    }
    elsif($text=~/hail/i && !defined($Sleeperawake)) {
        quest::say("You have traveled a great distance, and already bested a great many challenges to find me here, so for that I salute your effort. However, mortal being, your effort has been in vain, for the challenges that await you are far more difficult than that which you have encountered thus far. That you have reached me here shows that you are indeed headstrong and able, however do not confuse these things with the ability to best the $guardians which walk these halls beyond.");
    }
    elsif($text=~/forsaken/i && defined($Sleeperawake)) {
        quest::say("Beyond this hall you will find creatures of even greater spite and power. Beyond this hall you will begin to understand the immensity of the situation which you are in, as well as the control that the Ancients have on those who enter this lair. If I were in your position, I would turn back and leave the lair before ancient $text2 erupted into my very essence, as it is surely to do in yours and as it has in many before you.");
    }
    elsif($text=~/chaos/i && defined($Sleeperawake)) {
        quest::say("I'm sure by now that you're aware of the power that the great prismatic dragon contained. As he grew in power and influence, he also grew darker and darker in consciousness. The very essence of his being had turned into a twisted and maligned spirit, wrought with evil and demented into hatred. These thoughts had been taken out upon dragon kin, scraping the dark thoughts and emotions upon them so that they would never sway under the righteous power of the great prismatic. However, all was not well for the dragons and they would not stand by to take the $abuse for long.");
    }
    elsif($text=~/abuse/i && defined($Sleeperawake)) {
        quest::say("Kerafyrm had insulted the pride, power, and efficacy of the dragons for quite some time. However, as he continued, so continued the growls of discontent. It wasn't long before those growls turned into an uproar, filled to the brim with the courage of the Claws of Veeshan as they deemed it necessary to take action. Their action was to push back against the stringent hold of Kerafyrm through outright aggression, which led the dragons into a bloody, violent civil $war.");
    }
    elsif($text=~/war/i && defined($Sleeperawake)) {
        quest::say("There were some dragons and their kin that sided with Kerafyrm, defending his prophetic nature to the last. However, no matter the odds, the war that ensued insured death on both sides. Dragon, drake, wyvern, and wyrm corpses littered the battlefield, a testament to Kerafyrm's fortitude. Despite his efforts though, the great prismatic beast was pushed back into his lair, here where you stand, and put into stasis by dragons of all elements. For years he was held in a tenuous state, almost breaking free several times, as the Claws of Veeshan oversaw the construction of a velium subsystem of $tunnels.");
    }
    elsif($text=~/tunnels/i && defined($Sleeperawake)) {
        quest::say("The tunnels of the final tomb, deep down below the main of the lair,where Kerafyrm was to be kept by the four most powerful elemental dragons. There he would sleep forever as the four warders kept him in a stae of unconsciousness. That is the history of the ancient chaos as best I know it. As you are aware those mighty warders were disturbed and slain by those of our kind, mortal beings with the greediest of $motives.");
    }
    elsif($text=~/motives/i && defined($Sleeperawake)) {
        quest::say("The singular purpose behind all mortal beings is the acquisition of wealth. Though some would argue that they strive to gain knowledge and insight into the world, it is just a means to an end. I warn you that if you are here to that end, find it you may, but endure it you may not. You will need all the skill you can muster either way, so go now and I bid you good luck.");
    }
}


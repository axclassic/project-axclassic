######################################
## NPC: Lyris_Moonbane              ##
## Zone: Qcat - Necro GM            ##
## Revised by caved for AX-CLASSIC  ##
## Updated by Congdar               ##
## Quests:                          ##
##  Necromancer newbie note         ##
##  Tunic of Riddosan               ##
##                                  ##
######################################

sub EVENT_SAY {
    my $note = quest::saylink("note", 1);

    if($text=~/Hail/i) {
        quest::say("Welcome $name, welcome to the new order of life. I am Lyris Moonbane and serve Bertoxxulous. Did you have a $note for me?");
    }
    if($text=~/note/i) {
        quest::say("Yes! The little note u got when u started, hand it over to me please!");
    }
    if($text=~/assignment/i) {
        quest::say("We have just the thing for your friends back home. It will take some doing, but the pay off will be lovely indeed. In that jar you must combine 4 substances. You'll need two portions of a [goblin..source], one portion of [green river sludge], and one [potion of an experimental nature] that an agent of ours is working on. Bring the mixture back to me and we'll speak again.");
    }
    if($text=~/goblin source/i) {
        quest::say("The goblins of Antonica are known for their filthy habits and unclean practices. They often carry a menagerie of diseases and conditions. A more concentrated form of this aspect of goblin life cannot be found anywhere else but in the sewers of their citadel in Runny Eye. They must have workers who maintain the sewers. Find them and find the substance.");
    }
    if($text=~/green river sludge/i) {
        quest::say("The ogres of Oggok don't spend much time on sanitation, so naturally their kind harbors many diseases. This is easily apparent in the river that runs near their city, Greenblood. Down at the very bottom of the river is where the ancient plagues have come to rest and hibernate. Once the sludge is mixed in with the other substances, those glorious blessings of Bertoxxulous will most assuredly awaken.");
    }
    if($text=~/potion of an experimental nature/i) {
        quest::say("We have an agent studying in Freeport. Well, she actually isn't in Freeport proper but rather under it, in the sewers. Her name is Driana Poxsbourne. When you find her, tell her I have sent you for the substance. She will most likely have a task for you to complete before she can give you the fourth portion. Obey her.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 18721 =>1 )) {#Necromancer Newbie Note
        quest::say("Good work $name, Thank you for the note, yes i had received word that a young Necromancer was coming to join our realms. I am here to see to it that you start your training as soon as possible. Please go and talk to Bruax Grengar....");
        quest::summonitem(13552);
        quest::ding();
        quest::exp(1000);
        quest::faction(21,1);
        quest::faction(135,-1);
        quest::faction(235,-1);
        quest::faction(257,-1);
        quest::faction(53,1);
    }
    if(plugin::check_handin(\%itemcount, 1792 =>1 )) {#Heavy Locked Chest
       quest::emote("examines the lock on the chest and pulls a black key from a pouch at her hip. The lock clicks open. Her eyes widen as she carefully opens the chest, revealing a pile of platinum coins and a small note. After admiring the coins she takes the note and reads it. The necromancer glances up, then at her spectral pet who then hands you a glass jar.");
       quest::say("Are you ready for your first [assignment], $race?");
       quest::ding();
       quest::exp(1000);
       quest::summonitem(17060);
    }
    if(plugin::check_handin(\%itemcount, 1795 =>1 )) {#Sealed Jar
       quest::emote("takes the jar from you and examines it closely.  She opens the jar and adds some other ingredients and hands you the new mixture.");
       quest::say("Nice work $name! Now empty this into the river source in the Warrens and we will be rid of those Kobolds soon enough!");
       quest::ding();
       quest::exp(1000);
       quest::summonitem(1799);#Harbinger of Bertoxxulous
    }
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat Lyris_Moonbane

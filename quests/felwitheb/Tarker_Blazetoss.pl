# NPC: Tarker_Blazetoss (ID:62019)
# Wizard Guildmaster
#
# Quests:
#   Enrollment Letter (Wizard)
#   Black Wolf Skin
#
#
#Threeflies - added saylink

sub EVENT_SAY {

my $perform = quest::saylink("perform a task");


    if ($text=~/Hail/i) {
        quest::say("Hail and well met, $name! Have you come to study, or can you $perform for me this day?");
    }

    if ($text=~/perform a task/i) {
        quest::say("That is the spirit. There are many black wolves wandering Faydark these days. One of my brethren needs a black wolf skin as a component for his magic. Bring me a black wolf skin, and I shall reward you for your efforts.");
    }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 18779 => 1)) { # Enrollment Letter (Wizard)
        # Not sure about the right text, just copied from Niola Impholder
        quest::say("Welcome. I am Tarker Blazetoss. Master Wizard of the Keepers of the Art. Here is our guild robe. You have much to learn, so let's get started.");
        quest::summonitem(13594); # Singed Training Robe
        quest::ding();
        quest::exp(1000);
    }

    # Quest: Black Wolf Skin
    if (plugin::check_handin(\%itemcount, 13758 => 1)) { # Black Wolf Skin
        quest::say("This is just what I needed.. and with hardly a mark on it! You have my thanks. Here is something that you might find useful.");
        # Random reward:
        #   Copper Band (ID:10004)
        #   Rusty Dagger (ID:7007)
        #   Spell: Numbing Cold (ID:59964)
        #   Spell: O`Keils Radiation (ID:15378)
        quest::summonitem(quest::ChooseRandom(10004, 7007, 59964, 15378));
        quest::faction(99, 10);   # +Faydark's Champions
        quest::faction(170, 10);  # +Keepers of the Art
        quest::faction(178, 10);  # +King Tearis Thex
        quest::faction(322, -10); # -The Dead
        quest::ding();
        quest::exp(1000);
    }

    plugin::return_items(\%itemcount); # Return unused items
}
#END of FILE Zone:felwitheb  ID:62019 -- Tarker_Blazetoss

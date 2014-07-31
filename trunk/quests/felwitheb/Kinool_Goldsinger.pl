# NPC: Kinool Goldsinger (ID:62020)
# Enchanter Guildmaster
#
# Quests:
#   Enrollment Letter (Enchanter)
#   Rain Caller

sub EVENT_SAY {
    if ($text=~/Hail/i) {
        quest::say("Hail and welcome. I am sure you have much to do, but could I ask a [favor] of you?");
    }

    if ($text=~/favor/i) {
        quest::say("Oh, um, on second thought, never mind. I should really just do it myself. Thank you anyway.");
    }

    if ($text=~/enchanted bow/i) {
        quest::say("Alas... Another ranger in search of the [Rain Caller]. She is no more.");
    }

    if ($text=~/Rain Caller/i) {
        quest::say("Rain Caller is the name we give each Trueshot longbow once it is enchanted. Unfortunately, I am unable to enchant them any longer. One of the components is no longer available. Someone would have to strike a [deal with the fairie folk]. Once I have that and the [remaining components] I can create the Rain Caller, a ranger's bow.");
    }

    if ($text=~/fairie folk/i) {
        quest::say("The fairie princess, Joleena, used to have a metal gnome deliver [fairie gold dust] to the Keepers every month. She has stopped this and now refuses to offer it to any nation of Faydwer. What she is angry about, we do not know.");
    }

    if ($text=~/gold dust/i) {
        quest::say("Fairie gold dust is an enchanted powder which only a fairie princess can create.");
    }

    if ($text=~/remaining components/i) {
        quest::say("The remaining components are the Trueshot longbow and a treant heart. There will also be the guild donation in the amount of 3000 gold coins. These and the [fairie gold dust] will merit a ranger the Rain Caller enchanted bow.");
    }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 18778 => 1)) { # Enrollment Letter (Enchanter)
        quest::say("Greetings and welcome aboard! My name's Kinool. Master Enchanter of the Keepers of the Art. Here is your guild tunic. Make us proud, young pupil!");
        quest::summonitem(13593); # Torn Training Robe
        quest::ding();
		quest::faction(170, 10); #Keepers of the Art
		quest::faction(99, 10); #Faydarks Champions
        quest::faction(322, -30); #The Dead
        quest::exp(1000);
    }

    # Quest: Rain Caller
    #   Pouch of Gold Dust (ID:12333)
    #   Wooden Heart (ID:12334)
    #   Trueshot Longbow (ID:8401)
    #   3000gp
    if (plugin::check_handin(\%itemcount, 12333 => 1, 12334 => 1, 8401 => 1, $gold >= 3000)) {
        quest::say("Fine work!! I now reward you with The Rain Caller.");
        quest::ding();
        quest::exp(5000);
        quest::summonitem(8402); # Rain Caller
    }
     else {
   plugin::try_tome_handins(\%itemcount, $class, 'Enchanter');
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
}
#END of FILE Zone:felwitheb  ID:62020 -- Kinool_Goldsinger

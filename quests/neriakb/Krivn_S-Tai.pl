# NPC: Krivn S`Tai (ID:41046)
#
# Quests:
#   Bone Mail Armor
#
# Revised by Asram 04-03-2009

sub EVENT_SAY {
    if ($text=~/Hail/i) {
        # Made up text in case players forget the key words
        quest::say("If you are a Shadowknight crafting Bone Mail, you must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
    }

    if ($text=~/materials/i) {
        quest::say("Many species of dangerous creatures and even the walking remains of the dead inhabit the Nektulos Forest. You must defeat these creatures and undead in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft Bone Mail [gloves], [boots], [bracer], [coif], [leggings], [sleeves], or [tunic]?");
    }

    if ($text=~/boots/i) {
        quest::say("To craft Bone Mail Boots you require two [silk thread], two ruined wolf pelts, and two calcified foot bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Boot Pattern.");
        quest::summonitem(19561); # Tattered Boot Pattern
    }

    if ($text=~/bracer/i) {
        quest::say("To craft a Bone Mail Bracer you require a [silk thread], a ruined wolf pelt, and a calcified ulna bone. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Bracer Pattern.");
        quest::summonitem(19558); # Tattered Wristband Pattern
    }

    if ($text=~/coif/i) {
        quest::say("To craft a Bone Mail Coif you require two [silk thread], a ruined wolf pelt, and a calcified skull. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Cap Pattern.");
        quest::summonitem(19555); # Tattered Cap Pattern
    }

    if ($text=~/gloves/i) {
        quest::say("To craft Bone Mail Gloves you require two [silk thread], a ruined wolf pelt, and two calcified finger bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Glove Pattern.");
        quest::summonitem(19559); # Tattered Glove Pattern
    }

    if ($text=~/leggings/i) {
        quest::say("To craft Bone Mail Leggings you require three [silk thread], a low quality wolf pelt, two calcified tibia, and a calcified pelvis. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Leggings Pattern.");
        quest::summonitem(19560); # Tattered Pant Pattern
    }

    if ($text=~/sleeves/i) {
        quest::say("To craft Bone Mail Sleeves you require two [silk thread], a low quality wolf pelt, and two calcified humerus bones. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Sleeves Pattern.");
        quest::summonitem(19557); # Tattered Sleeve Pattern
    }

    if ($text=~/tunic/i) {
        quest::say("To craft a Bone Mail Tunic you require four [silk thread], a medium quality wolf skin, a calcified sternum, and a calcified ribcage. Once you have the necessary components combine them in your Bone Mail Kit with this Tattered Tunic Pattern.");
        quest::summonitem(19556); # Tattered Tunic Pattern
    }

    if ($text=~/silk thread/i) {
        quest::say("To craft a silk thread, combine two spiderling silks in a Loom."); # Made up text
    }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 19584 => 1)) { # Request Parchment
        quest::say("So you are one of Ulraz's new recruits. You are to assist in the construction of the armor you will don as a new Shadowknight of the Lodge of the Dead. I have assembled a kit that is used in the crafting of Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
        quest::summonitem(17124); # Mail Assembly Kit
    }
}
#END of FILE Zone:neriakb  ID:41046 -- Krivn_S`Tai

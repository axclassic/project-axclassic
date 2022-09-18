#TimeB FD quest
#The Plane of Time >> Einla (223227)
#threeflies
#Ax_Classic
#December 2012

sub EVENT_SPAWN {
	quest::settimer("feign", 5);
}

sub EVENT_TIMER {
    if($timer eq "feign") {
        quest::stoptimer("feign");
        $npc->SetAppearance(3);
    }
}

sub EVENT_SAY {
    #shortcuts
    $npc->SetAppearance(0);
    if($text =~/hail/i) {
        quest::say ("Welcome to Time, $name. To have a chance of beating the God's of this plane you will need more than your army of magical minions. I posses a [powerful ring] that could help you in your quest");
    }

    if($text =~/powerful ring/i) {
        quest::say ("We discovered the [Cloud of Death] ring whilst exploring the destroyed city of Chardok, it was found in a secret passage leading off from the Overking's chamber.");
    }

    if($text =~/cloud of death/i) {
        quest::say ("The cloud of Death will hide you from your foes, you will appear slain and still to all who cast their eyes over your apparent lifeless corpse, however magic so powerful comes at a cost. Hand me a sum fit for a Prince and I will gladly let you borrow the item. Shall we say 150 Platinum pieces?");
        quest::emote ("Taps her foot impatiently");
    }
}

sub EVENT_ITEM {
    if($platinum == 150) {
        quest::say("A wise choice $name");
        quest::summonitem(627);
        quest::settimer("feign", 2);
    }
    else {
        plugin::return_items(\%itemcount);
    }
}



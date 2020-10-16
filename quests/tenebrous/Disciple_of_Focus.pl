# Disciple_of_Focus (172419)

sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::say("I see you have finally come. I have sensed someone with the ability to confront the darkness before the Order coming. I know that this is you. Before you can continue I must know if this is the case. If so, you will [challenge] me.");
    }
    if($text=~/challenge/i) {
        quest::say("Prepare yourself then $name, for this will not be a battle you will want to lose.");
        quest::attack($name);
    }
}

sub EVENT_DEATH {
    quest::say("You have done well. May you continue to prosper through your trials.");
}


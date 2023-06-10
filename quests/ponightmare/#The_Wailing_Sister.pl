sub EVENT_SAY {
    if($text=~/Hail/i && plugin::check_hasitem($client, 119981)) {
        quest::emote(" cackles as she assaults you.");
        quest::modifynpcstat("special_attacks", SERTQMCNIDf);
        quest::attack($name);
    }
    else {
        quest::emote(" moans sadly but doesn't seem to notice you.");
    }
}

sub EVENT_TRADE {
    quest::plugin_returnitems(\%itemcount);
}


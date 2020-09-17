# 223250.pl new beehive indestructible used for head hand in

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 119953 => 1)) {
        quest::spawn2(223214,0,0,-656.2,-1096.5,-2.7,60);
        quest::depop();
    }
}


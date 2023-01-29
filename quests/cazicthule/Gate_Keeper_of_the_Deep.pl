# Gate_Keeper_of_the_Deep

sub EVENT_SAY {
    my $Ancient = quest::saylink("Ancient", 1);
    my $worthy = quest::saylink("worthy", 1);
    if($text=~/Hail/i) {
        quest::say("Greetings traveler, are you here seeking the $Ancient Greenblood Piranha?");
    }
    elsif($text=~/Ancient/i) {
        quest::say("Very well I will summon him if you are proven to be $worthy of this fight.");
    }
    elsif($text=~/worthy/i && (defined $qglobals{"EpicBox"} == 1)) {
        quest::say("You have indeed proven your worthiness.");
        quest::say("Prepare yourself $name!");
        quest::setglobal("CazicEpic", 1, 5, "H1");
        quest::depop(48433);
        quest::depop(48435);
        quest::depop(48434);
        quest::depopall(48247);
        quest::depopall(48442);
        quest::depopall(48441);
        quest::depopall(48248);
        quest::depopall(48439);
        quest::depopall(48039);
        quest::depopall(48152);
        quest::depopall(48038);
        quest::depopall(48283);
        quest::depopall(48074);
        quest::spawn2(48434,40,0,49.9,442,-129.1,0);
        quest::spawn2(48435,39,0,46.8,393,-119.9,197.5);
        quest::spawn2(48437,43,0,82,489.9,-125.1,0);
        quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
        quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
        quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
        quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
        quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
        quest::depop();
    }
    else {
        $client->Message(14,"$name, You are not yet worthy. Be Gone from my sight!");
    }
}


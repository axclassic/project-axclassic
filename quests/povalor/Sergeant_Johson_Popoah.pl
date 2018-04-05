##Sergeant_Johson_Popoah  ID 208015 ##

sub EVENT_SAY {
    my $compound = quest::saylink("compound", 1);
    if($text=~/Hail/i && !defined($qglobals{Aerinkey})) {
        quest::say("State your business or leave our $compound.");
        quest::setglobal("Aerinkey", 1, 5, "F");
    }
    elsif($text=~/Hail/i && ($qglobals{Aerinkey} == 1)) {
        quest::say("Leave now before there is bloodshed");
    }
    elsif($text=~/compound/i && ($qglobals{Aerinkey} == 1)) {
        quest::say("This is the primary command center for Che Virtuson. We fall under the leadership and guidance of Captain Ryglot. I must now ask you to leave.");
    }
}

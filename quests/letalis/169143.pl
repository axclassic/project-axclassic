sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}
sub EVENT_ENTER {
    my $Essence = quest::saylink("Essence", 1);
    quest::say("Halt! Do you seek The $Essence of Earth?");
}
sub EVENT_SAY {
    if($text=~/Essence/i && defined $qglobals{"EpicBox"} == 1) {
        quest::settimer(169,1800);
        quest::say("Very well $name, You are indeed worthy, Make your way to the top of the tower, The Essence of Earth is waiting."); 
        quest::depopall(169129);
        quest::depop(169128);
        quest::depop(169130);
        quest::depop(169131);
        quest::depop(169132);
        quest::depop(169133);
        quest::depop(169134);
        quest::depop(169135);
        quest::depop(169136);
        quest::depop(169137);
        quest::spawn2(169127,0,0,348.5,60.5,201,8.2);
        quest::spawn2(169138,507077,0,584.5,94.5,206,208.5);
        quest::spawn2(169141,0,0,332.2,2.1,201,1);
        quest::spawn2(169139,0,0,404.7,97.6,202.2,173.9);
        quest::spawn2(169140,0,0,382.5,9.6,202.2,0.8);
        quest::spawn2(169142,0,0,310.5,100.2,202.2,74);
    }
    elsif($text=~/Essence/i && !defined $qglobals{"EpicBox"}) {
        quest::say("Mortal, you know not what you ask for. Begone from this place!");
    }
}
sub EVENT_TIMER {
    quest::stoptimer(169); 
    quest::depop(169127);
    quest::depop(169138);
    quest::depop(169139);
    quest::depop(169140);
    quest::depop(169141);
    quest::depopall(169142);
    quest::depop();
}


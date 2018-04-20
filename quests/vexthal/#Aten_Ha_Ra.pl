sub EVENT_SPAWN {
    quest::settimer("atenha",2);
}

sub EVENT_TIMER {
    if($timer eq "atenha") {
        if(defined($qglobals{aten})) {
            quest::stoptimer("atenha");
            quest::depop();
            $qglobals{aten} = undef;
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("atenha");
    my $variance = int(rand(720));
    my $spawntime = 6480 + $variance;
    quest::setglobal("aten",1,3,"M$spawntime");
}
# #Aten_Ha_Ra Destroy NPCID: 158306


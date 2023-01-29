# spawn 2 rounds of adds during acidic mass encounter
# first round at 66% - 1 ooze
# second round at 33%  - 2 swirling ooze
# after 1 and a half hour he despawns

sub EVENT_SPAWN {
     quest::settimer("depop",5400);
     quest::setnexthpevent(66);
}

sub EVENT_HP {
    if($hpevent == 66) {
        my $x1 = $npc->GetX();
        my $y1 = $npc->GetY();
        my $z1 = $npc->GetZ();
        my $h1 = $npc->GetHeading();
        quest::spawn2(48004,0,0,$x1 - 10,$y1,$z1,$h1);
        quest::setnexthpevent(33);
    }
    if($hpevent == 33) {
        my $x2 = $npc->GetX();
        my $y2 = $npc->GetY();
        my $z2 = $npc->GetZ();
        my $h2 = $npc->GetHeading();
        quest::spawn2(48001,0,0,$x2 - 10,$y2,$z2,$h2);
        quest::spawn2(48001,0,0,$x2 + 10,$y2,$z2,$h2);
    }
}

sub EVENT_TIMER {
       quest::depop();
       quest::stoptimer("depop");
}

sub EVENT_DEATH {
  quest::stoptimer("depop");
}

# EOF zone: Cazicthule ID: NPC: #an_acidic_mass
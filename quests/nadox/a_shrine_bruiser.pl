# respawn named mob on Karsonizzak_Bloodblade (227115) death
# Enestox, Angelox

sub EVENT_DEATH {
    my $random_result = int(rand(100));
    if(($random_result > 95) && ($kars eq "2")) {
        my $a = 227115; #Karsonizzak_Bloodblade
        my $x1 = $npc->GetX();
        my $y1 = $npc->GetY();
        my $z1 = $npc->GetZ(); 
        my $h1 = $npc->GetHeading();
        quest::spawn2($a,0,0,$x1,$y1,$z1,$h1);
        quest::setglobal("kars","3",3,"F");
    }
}

# EOF zone: nadox NPCs:a_shrine_bruiser


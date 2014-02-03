#################################
#Stage Three of Grokal line     #
#Betrayal Quest Line Phase 4    #
#Resqu Miplez                   #
#Date 5/5/13                    #
#################################

sub EVENT_SPAWN{
    quest::settimer("Ggrokal",7200); #depop after 2 hours
}

sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    
    quest::say("Maybe you should try again $race. Your attempts are sad to say the least!");
    quest::spawn2(87159,0,0,$x,$y + 5,$z,$h); #Mighty Grokal
}

sub EVENT_TIMER {
if ($timer eq "Ggrokal") {
quest::depop();
}
 }

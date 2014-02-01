#################################
#Stage Four of Grokal line      #
#Betrayal Quest Line Phase 4    #
#Resqu Miplez                   #
#Date 5/5/13                    #
#################################

sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    
    quest::shout("I'm done toying with you, $class. Let us see if you can defeat my might.");
    quest::spawn2(87160,0,0,$x,$y + 5,$z,$h); #death Grokal
}

#################################
#Stage Two of Grokal line       #
#Betrayal Quest Line Phase 4    #
#Resqu Miplez                   #
#Date 5/5/13                    #
#################################

sub EVENT_SPAWN{
    quest::say("So I see you have done well! Know I shall take all the secrets from you!");
    quest::settimer("grokal",7200); #depop after 2 hours
}
sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    
    quest::say("You think victory is yours? Laughable!");
    quest::spawn2(87158,0,0,$x,$y + 5,$z,$h); #Great Grokal
}

sub EVENT_TIMER {
if ($timer eq "grokal") {
quest::depop();
}
 }
   


## a_chest 317121 upon death spawns Progression elemental##
sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
 quest::spawn2(317149,0,0,$x,$y,$z,$h);
}
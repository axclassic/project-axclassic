
sub EVENT_SPAWN {
    quest::settimer(1, 30);
  }
sub EVENT_TIMER {
   if($egg_timer == 1){
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(343162,0,0,$x,$y,$z,$h);
  quest::stoptimer(1);
  quest::depop();
}
}

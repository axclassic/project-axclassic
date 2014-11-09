## Resqu Lower Level GM event ##
sub EVENT_SPAWN{
quest::pathto(204,150,0)
}

sub EVENT_AGGRO{
 if ($ulevel => 40){
    quest::depop();
}
 else{
    quest::emote("Die, foolish $race");
}
}
sub EVENT_DEATH {
  my $a = quest::ChooseRandom(54298,54301,54300,54298,54301,54300,54298,54301,54300,54298,54301,54300,54298,54301,54300,54298,54301);
  my $b = quest::ChooseRandom(54298,54301,54300,54298,54301,54300,54298,54301,54300,54298,54301,54300,54298,54301,54300,54298,54301);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::spawn2($b,0,0,$x,$y,$z,$h);
  quest::signalwith(54299,1,1);
}

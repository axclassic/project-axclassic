#NPC tabien_the_goodly (50033)
##Trivial repop script added by Threeflies 2012
#Ax_Classic

sub EVENT_SPAWN
{
my $x;
my $y;
my $z;
my $h;

$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$h = $npc->GetHeading();

  
  quest::set_proximity( $x-40,$x+40,$y-40,$y+40,$z-40,$z+40);
}

sub EVENT_ENTER
{
    if($ulevel >= 45) {
quest::depop();
quest::spawn2(50643,0,0,1570,6325,4,2);
}
}
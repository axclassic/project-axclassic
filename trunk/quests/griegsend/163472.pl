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


 	quest::set_proximity( $x-10,$x+10,$y-10,$y+10,$z-10,$z+10);
	}
sub EVENT_ENTER {
	quest::spawn2(163015,0,0,3443.6,-230.0,-9.0,251.3);
	quest::depop;
    }


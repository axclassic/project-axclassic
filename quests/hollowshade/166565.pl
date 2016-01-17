my %AggroText = (
  1 => "Don't run. Make this easier on both of us.",
  2 => "Don't worry, this will be quick.",
  3 => "I've always wanted to eat someone like you.",
  4 => "Interfere with our fishing will you? If you want to be eaten, you'll have to wait your turn!"
);

my %DeathText = (
  1 => "coughs up a bit of blood. 'You'll never escape us. . .'",
  2 => "screams as it collapses.'",
  3 => "staggers for a moment and then collapses."
);

sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}
sub EVENT_ENTER {
    quest::say("Tribesmen, we are under siege!");
        }
sub EVENT_AGGRO {
  my $RandomNumber = int(rand(4)) + 1;
  quest::emote("$AggroText{$RandomNumber}");
}

sub EVENT_DEATH{
my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
     quest::signalwith(166824,650,0);
}



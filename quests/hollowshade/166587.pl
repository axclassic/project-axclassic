my %AggroText = (
  1 => "assails you with a deafening shriek!",
  2 => "emits a loud screech, vibrating the ground at your feet.",
  3 => "snaps its powerful beak."
);

my %DeathText = (
  1 => "emits a muffled screech as it collapses.",
  2 => "twitches as life fades from its round yellow eyes."
);
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}
sub EVENT_ENTER {
    quest::emote(' catches sight of an enemy and ruffles its feathers in anger.');
        }
sub EVENT_AGGRO {
  my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$AggroText{$RandomNumber}");
}

sub EVENT_DEATH{
my $RandomNumber = int(rand(2)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
}

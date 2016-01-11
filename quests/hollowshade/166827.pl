my %DeathText = (
  1 => "emits a muffled screech as it collapses.",
  2 => "twitches as life fades from its round yellow eyes."
);

sub EVENT_WAYPOINT {
    if ($wp == 11) {
quest::signalwith(166821,500,0);
}
    elsif ($wp == 19) {
quest::signalwith(166821,509,0);
quest::depop();
}
}
sub EVENT_DEATH {
  my $RandomNumber = int(rand(2)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
quest::signalwith(166823,6121,0);
}


my %DeathText = (
  1 => "emits a muffled screech as it collapses.",
  2 => "twitches as life fades from its round yellow eyes."
);

sub EVENT_WAYPOINT {
    if ($wp == 11) {
quest::signalwith(166663,700,0); #a_sonic_wolf_lookout
}
    elsif ($wp == 30) {
quest::signalwith(166663,709,0); #a_sonic_wolf_lookout
quest::depop();
}
}
sub EVENT_DEATH {
  my $RandomNumber = int(rand(2)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
quest::signalwith(166662,4121,0); ##Owls_attack_Wolves_Fail_Counter
}
#a_furious_owlbear script


#Nightknife_Gresga
sub EVENT_SPAWN {
quest::shout("Where are all my bretheren? I see you Lurking about, are you responsible for this?");
quest:shout("Death is upon you now!");
}

sub EVENT_DEATH {
  quest::say("This cannot be...");
  quest::signalwith(167990,7225,0);
 } 
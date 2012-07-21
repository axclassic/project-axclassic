# Shaman Epic 1.0
# Tabien_the_Goodly_ (50643)
# Erud's Crossing (erudxing)
# Aramid September 2006
#Trivial repop script added by Threeflies 2012
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

sub EVENT_EXIT
{
    if($ulevel >= 45) {
quest::depop();

}
}



sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::emote("Oh thank Marr you are here, $name. I was beginning to think I would be abandoned in my time of need. I have a [task] for you to complete in the name of my patron Mithaniel Marr");
  }
  if($text=~/task/i) {
   quest::emote("displays his shield that must once have been shining and regal but is now scoured in cuts, dents, and chipped paint. He says, 'This shield is known as Marr's Promise. It is a sacred relic that was actually used by one of Mithaniel's angels on the Plane of Valor. Its value to our church is immeasurable and I have been charged with the protection of it. However, a patriarch of the false god, Bertoxxulous, is after my shield and me. He must be stopped! Please, destroy him and bring me proof of his death.");
  }
}


# End of File - NPCID 50643 - Tabien_the_Goodly_
sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::emote("ignores you.");
   }
}

sub EVENT_ITEM {
   if((plugin::check_handin(\%itemcount, 1684 => 1)) && ($ulevel>=46)) {
      # Monk Epic 1.0
      quest::say("Hahaha! That dolt Eejag fell to the likes of you? I am not surprised. So, I guess this means you are here to challenge me. Normally, I would not waste my time, but since you have defeated my younger brother, I suppose I am obligated.");
      # Spawn: Gwan
      my $x = $npc->GetX();
      my $y = $npc->GetY();
      my $h = $npc->GetHeading();
      quest::spawn2(71069,0,0,$x,$y,-8,$h);
      quest::depop();
   }
   else {
      quest::say("I have no need for this, $name.");
      quest::return_items(\%itemcount);
   }
}
# End of File a_presence NPCID: 71066


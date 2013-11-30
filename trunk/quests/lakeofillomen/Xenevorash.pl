sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  # Set proximity
  quest::set_proximity($x-50,$x+50,$y-50,$y+50);
}

sub EVENT_ENTER {
 if(($class eq "Warrior","Paladin", "Ranger", "Druid", "Cleric", "Berserker", "Bard", "Magician", "Shadowknight", "Necromancer". "Rogue", "Beastlord", "Enchanter", "Monk", "Shaman", "Wizard") && ($ulevel>=46)){
  # Monk Epic 1.0
  quest::attack($name);
 }
}

sub EVENT_DEATH {
  quest::shout("Grraaaagghhhh!! Not..Possible!");
}
# End of File
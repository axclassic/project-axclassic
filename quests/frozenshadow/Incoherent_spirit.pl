# Incoherent_spirit NPCID - 111135
# Killing him spawns the coherent spirit lucid_spirit_of_Abrams

sub EVENT_DEATH {
    $abrams = quest::spawn2(111147,0,0,$x,$y,$z,0);
  
}
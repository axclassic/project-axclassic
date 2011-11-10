sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::emote("holds a cracked monocle up to his squinty eye.  'I say!!  A talking bear!!  Squire Fuzzmin, come and take a gander at this rare find.  The wonders never cease in the land of Kunark!!' ");
    quest::unique_spawn(84312,0,0,1985,-2243,-75);
    quest::delglobal("hobble");
    quest::setglobal("hobble",$npc->GetID(),"3","F");
    $hobble=undef;
  }
}

# Spawning Squire_Fuzzmin when hailed, for Wurmslayer quest

# EOF zone: firiona ID: 84297 NPC: Sir_Hobble

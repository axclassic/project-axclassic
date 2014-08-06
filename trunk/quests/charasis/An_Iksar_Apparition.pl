#Quests covered in this file:
#Shaman Skull Quest 8

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 30994 => 1)) { #Iksar Relics
    quest::unique_spawn(105290,0,0,$x,$y,$z); #Venril Sathir
    quest::unique_spawn(105294,0,0,$x+5,$y-5,$z); #an Arisen Disciple
    quest::unique_spawn(105291,0,0,$x+5,$y+5,$z); #an Arisen Priest
    quest::unique_spawn(105292,0,0,$x-5,$y+5,$z); #an Arisen Necromancer
    quest::unique_spawn(105293,0,0,$x-5,$y-5,$z); #an Arisen Acolyte
    quest::depop();
  }
  else {
    quest::emote("ignores you.");
    plugin::return_items(\%itemcount);
  }
}
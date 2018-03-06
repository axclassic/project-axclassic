sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 14319 => 1)) {
      quest::spawn2(72106,0,0,$x,$y,$z,$h);
      quest::depop();
   }
}
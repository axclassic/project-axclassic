sub EVENT_DEATH {
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   $sirran= undef;
   quest::setglobal("sirran",2,3,"M10");
   quest::spawn(71058,0,0,$x-10,$y,$z+10);
}

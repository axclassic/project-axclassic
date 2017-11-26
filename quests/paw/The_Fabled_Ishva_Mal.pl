####Fabled Depoper###
### Romell 6-9-09
### Congdar 11-26-17

sub EVENT_SPAWN {
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   quest::set_proximity($x - 390, $x + 390, $y - 390, $y + 390);
}

sub EVENT_ENTER {
   if($ulevel <= 29) {
      quest::shout("We shall meet again $name! When you are a worthy opponent!!");
      quest::depop;
   }
}


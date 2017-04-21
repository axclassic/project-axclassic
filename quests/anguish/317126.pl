## Overloard door access 317126##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
sub EVENT_ENTER {
   my @clist = $entity_list->GetClientList();
        foreach my $c (@clist){
     if(defined $qglobals{"FKeldovan"} == 1 && defined $qglobals{"FTure"} == 1 && defined $qglobals{"FJelvan"} == 1 && defined $qglobals{"FHanvar"} == 1){
   quest::movepc(317,508.4,4752.9,277.5,248.1);
   }
   elsif(!defined $qglobals{"FKeldovan"} || !defined $qglobals{"FTure"} || !defined $qglobals{"FJelvan"} || !defined $qglobals{"Tready"}) {
    $c->Message(15, "The way is locked....It is held by the dead and the dead keep it.... The way is locked.");
  } 
   else {
   #Do nothing;
  }
 }
} 
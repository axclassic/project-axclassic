##Vyishe 317134##
sub EVENT_SPAWN {
my @clist = $entity_list->GetClientList();
        foreach my $c (@clist){
   quest::shout("Come! They have weakened him. Now is our chance to strike.");
   $c->Message(15,"Tendrils of energy shoot from the fingertips of the Riftseekers, turning Mata Murams magic inward.");
   }
 }
 sub EVENT_SIGNAL {
    if($signal == 9001) {
	quest::depop(317148);
   quest::depop(317129);
   quest::depop(317130);
   quest::depop(317131);   
   quest::depop(317132);
   quest::depopall(317133);
   quest::depop(317137);
   quest::depop(317135);
   quest::depop(317136);
   quest::depop();	
	}
 }
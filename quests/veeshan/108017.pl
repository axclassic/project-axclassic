# A_Guardian_of_Hoshkar
sub EVENT_SIGNAL {
   my $annoyingmob = $entity_list->GetMobID($signal);
   $npc->AddToHateList($annoyingmob, 10, 10);
}
# End of File


# A_Guardian_of_Nexona
sub EVENT_SIGNAL {
   my $annoyingclient = $entity_list->GetClientByID($signal);
   my $annoyingname = $annoyingclient->GetName();
   quest::attack($annoyingname);
}
# End of File


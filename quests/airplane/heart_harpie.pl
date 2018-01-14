sub EVENT_SIGNAL {
   my $annoyingclient = $entity_list->GetClientByID($signal);
   my $annoyingname = $annoyingclient->GetName();
   quest::say("How dare you, $annoyingname! You attack us after we allow you to enter our domain in peace? Time for you to die, $annoyingname!");
   quest::attack($annoyingname);
}
# End of File



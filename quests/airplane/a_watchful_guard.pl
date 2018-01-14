sub EVENT_SIGNAL {
   my $annoyingclient = $entity_list->GetClientByID($signal);
   my $annoyingname = $annoyingclient->GetName();
   quest::say("Oh! You're in big trouble now! We don't like intruders trying to kill us! Time for you to die, $annoyingname!");
   quest::attack($annoyingname);
}
# End of File


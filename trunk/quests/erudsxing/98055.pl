sub EVENT_WAYPOINT{
  quest::shout("Checking Variable!  It is $erudboat");
  if($erudboat == 100){
    quest::depopall(98056);
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",101,7,"F");
    quest::spawn2(98056,63,0,3884.3,1097.0,-22.5,191.8);
    $erudboat = undef;
  }
  my $u = $entity_list->GetMobByNpcTypeID(98056);
  if($u){quest::shout("Real boat is in zone!");}
    else {quest::shout("No real boat here!");}
}

sub EVENT_SIGNAL{
  quest::shout("Depopping!");
  quest::depop();
}

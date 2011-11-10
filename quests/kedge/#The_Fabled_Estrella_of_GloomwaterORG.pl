# respawn random mob on a a_spinereef_seahorse death - list favors another a_spinereef_seahorse 85% of the time
# Angelox

sub EVENT_DEATH{
 #quest::say("I'm dead");
 quest::delglobal("towss");
 quest::setglobal("towss",2,3,"F");
 $towss=undef;
  };

# EOF zone: kedge NPCs:Undertow (64087)
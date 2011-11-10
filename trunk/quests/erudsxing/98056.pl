sub EVENT_WAYPOINT{
  if($erudboat == 101){
    quest::shout("Boat is moving!  Setting 102!");
    quest::signal(98055);
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",102,7,"F");
    $erudboat = undef;
    }
  elsif($erudboat == 102){
    quest::shout("Boat is moving!  Setting 103!");
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",103,7,"F");
    $erudboat = undef;}
  elsif($erudboat == 103){
    quest::shout("Boat is moving!  Setting 104!");
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",104,7,"F");
    $erudboat = undef;}
  elsif($erudboat == 104){
    quest::shout("Boat is moving!  Setting 105!");
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",105,7,"F");
    $erudboat = undef;}
  elsif($erudboat == 105){
    quest::shout("Boat is moving!  Setting 106!");
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",106,7,"F");
    $erudboat = undef;}
  elsif($erudboat == 106){
    quest::shout("Boat is moving!  Setting 107!");;
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",107,7,"F");
    $erudboat = undef;}
  elsif($erudboat == 107){
    quest::shout("Boat is moving!  Setting 108!");
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",108,7,"F");
    $erudboat = undef;}
  elsif($erudboat == 108){
    quest::shout("Boat is moving!  Setting 109!");
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",109,7,"F");
    $erudboat = undef;}
  elsif($erudboat == 109){
    quest::shout("Boat is moving!  Setting 110!");
    quest::delglobal("erudboat");
    quest::setglobal("erudboat",110,7,"F");
    $erudboat = undef;}
}

sub EVENT_DEATH{
  quest::shout("I'm out of here!");
}

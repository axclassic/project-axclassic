# Burrower Beast event controller
# Threeflies - added emote's 23.12.2011

sub EVENT_SPAWN {
  $counter = 0;
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  quest::settimer("start_cycle",400);
  quest::emote("The ground around you begins to tremble and shake.");
  quest::clear_proximity();
}

sub EVENT_TIMER {
  $counter += 1;
  if ($counter <= 3) {
quest::emote("The giant burrower roars, causing the ground to rumble. You begin to sense movement around you.");
    quest::spawn2(164118,0,0,1780,227,-63.1,0); #rock burrower
    quest::spawn2(164118,0,0,1671,165,-18.9,0); #rock burrower
    quest::spawn2(164118,0,0,1649,233,-30.3,0); #rock burrower
    quest::spawn2(164118,0,0,1666,392,-14.9,0); #rock burrower
    quest::spawn2(164104,0,0,1747,392,-25.8,0); #spined rock burrower
    quest::spawn2(164104,0,0,1847,403,-34.5,0); #spined rock burrower
    quest::spawn2(164104,0,0,1870,389,-19,0); #spined rock burrower
    quest::spawn2(164104,0,0,1882,321,-30,0); #spined rock burrower
    quest::spawn2(164100,0,0,1852,206,-65.4,0); #stone carver
    quest::spawn2(164100,0,0,1903,160,-14.2,0); #stone carver
    quest::spawn2(164100,0,0,1837,146,-31.1,0); #stone carver
    quest::spawn2(164100,0,0,1770,294,-57.5,0); #stone carver
  }
  elsif (($counter >= 4) && ($counter <= 6)) {
quest::emote("The giant burrower begins to thrash in the narrow tunnel and the ground erupts around you!")
    quest::spawn2(164108,0,0,1780,227,-63.1,0); #core burrower
    quest::spawn2(164108,0,0,1671,165,-18.9,0); #core burrower
    quest::spawn2(164108,0,0,1649,233,-30.3,0); #core burrower
    quest::spawn2(164108,0,0,1666,392,-14.9,0); #core burrower
    quest::spawn2(164108,0,0,1747,392,-25.8,0); #core burrower
    quest::spawn2(164108,0,0,1847,403,-34.5,0); #core burrower
  }
  elsif ($counter == 7) {
quest::emote("The giant burrower roars in pain, releasing a foul current of air! ");
    quest::spawn2(164085,0,0,1747,392,-25.8,0); #parasite larva
    quest::spawn2(164085,0,0,1837,146,-31.1,0); #parasite larva
  }
  elsif ($counter == 8) {
quest::emote("The giant burrower begins to tunnel into the ground below it. As it digs, its flesh splits revealing an enormous parasite.");
    quest::stoptimer("start_cycle");
    quest::spawn2(164089,0,0,1780,227,-63.1,0); #burrower parasite
    $counter = 0;
    quest::depop();
  }
}

# zone: thedeep ID: 164120 NPC: The


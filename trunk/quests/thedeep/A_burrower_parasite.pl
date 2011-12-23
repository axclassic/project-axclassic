# signal burrower beast whether success or failure
#Threeflies added emote.

sub EVENT_SPAWN {
  quest::settimer("countdown",1800);
quest::emote(quest::emote("The giant burrower begins to tunnel into the ground below it. As it digs, its flesh splits revealing an enormous parasite.");
}

sub EVENT_TIMER {
  quest::signalwith(164098,101,0);
  quest::depop();
}

sub EVENT_DEATH {
  quest::signalwith(164098,201,0);
  quest::stoptimer("countdown");
}

# EOF zone: thedeep ID: 164089 NPC: A_burrower_parasite


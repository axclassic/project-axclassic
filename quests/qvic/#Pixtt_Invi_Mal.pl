# #Pixtt_Invi_Mal (295142)

sub EVENT_SPAWN {
   quest::setnexthpevent(15);
}

sub EVENT_HP {
   if($hpevent == 15) {
      quest::emote("begins casting Gate.");
      quest::settimer("casting", 10);
      quest::doanim(43);
   }
}

sub EVENT_TIMER {
   if($timer eq "casting") {
      quest::stoptimer("casting");
      quest::setnexthpevent(15);
      quest::doanim(43);
      quest::moveto(-1016.4, 159.0 -410);
   }
}

sub EVENT_DEATH {
   quest::stoptimer("casting");
   quest::emote("'s corpse crackles with cords of dark energy as it falls to the ground.");
}


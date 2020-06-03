# Anetal (320030)

sub EVENT_SPAWN {
    quest::settimer("sick", 5);
}

sub EVENT_TIMER {
    if($timer eq "sick") {
        quest::stoptimer("sick");
        # --dead
        $npc->SetAppearance(3);
    }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 69969 => 1)) {
      quest::say("Thank you $name you are very compassionate. My brother must have sent you! Return to him, and he shall reward you. Goodbye, fair knight.");
      quest::setglobal("paladin_epic_hollowc", "2", 5, "F");
      quest::depop();
   }
   else {
      plugin::return_items(\%itemcount);
   }
}


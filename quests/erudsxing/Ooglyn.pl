# Shaman Epic 1.0
# Ooglyn
# Erud's Crossing (erudxing)
# Aramid September 2006

sub EVENT_SAY {
 if ($faction < 3) {
   if($text=~/hail/i) {
     quest::emote("Ooooh, it you, $name. Me's been waitin for you cuz our frenz say you comin an need da test. So's I gib you da test. Hmm, now where me put it? Ooglyn been waiting for sign for so long dat me forget where me put test. Keep your eyes out for sign while me look for test. Oh, hey, $name, they gib you gem? I need dat gem, please, heheh.");
    }
 }

 else {
    $reply1 = ("I didn't know Slime could speak common..go back to the sewer before I lose my temper.");
    $reply2 = ("Oh look..a talking lump of refuse..how novel");
    $reply3 = ("I wonder how much I could get for the tongue of a blithering fool..leave before I decide to find out for myself.");
    $reply4 = ("Is that your BREATH..or did something die in here..now go away!");
    $a = quest::ChooseRandom($reply1, $reply2, $reply3, $reply4);
    quest::say ($a);
  }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 1666 => 1)) {
     quest::say("Ahhh, tank you, now me can...OH LOOK!! DA SIGN!!!! Oh, sorry you missed it. The sign show you where to wait for da test. Follow me...I like you so I take you there. We goin for a swim, $name!");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
     quest::moveto(4200.0,-1600.0,-287.3);
     $move = 1;
    }
   else {
     quest::emote("will not take this item.");
     plugin::return_items(\%itemcount);
     return;
    }
  }

sub EVENT_WAYPOINT {
   if ($move == 1) {
    quest::say("Ok, here is place for you to for waiting. Hab fun shaman!");
    quest::signalwith(98045,199,20000);
quest::depop();
   }
  }

sub EVENT_SIGNAL {
   if ($signal == 199) {
    quest::depop();
   }
   
 }

# End of File - NPCID 98009 - Ooglyn
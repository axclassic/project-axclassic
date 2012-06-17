# Shaman Epic 1.0
# Bondl Felligan
# Freportn
# Aramid September 2006

sub EVENT_SAY {
 if($text=~/hail/i) {
  quest::emote("burps loudly in your face and says, 'Bah! Leave me be, fool! You have nothin' I want and I certainly have nothin' you want.");
  }
 elsif(($text=~/booze/i) && ($move == 1)) {
   quest::emote("suddenly becomes completely sober and says, 'Very well, shaman, please come with me.");
   quest::spawn2(8117,0,0,67.7,60.6,31.1,247.4);
   $move = 2;
   quest::start(20);
  }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 1665 => 1)) {
   quest::say("WOW, thanks! This must be worth a fortune! I could drink for a month after sellin' this to one of them fool merchants. I'm going to see how much I can get for it right now!");
   quest::faction(342,10);
    quest::ding(); quest::exp(10000);
   quest::moveto(555.4,429.4,-20.7,161.8);
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
   quest::depop();
   quest::spawn2(8003,0,0,555.4,429.4,-20.7,161.8);
   quest::say("What!? You don't approve of me buyin' some drinks with this gem? Who the heck are you to offer me a gift and order me what to do with it? Is this some kinda conditional kindness? Well? Are you gonna let me buy some booze with this or not?");
   }
}

sub EVENT_SIGNAL {
 if ($signal == 199) {
  quest::depop();
 }
}


# End of File - NPCID 8003 - Bondl_Felligan


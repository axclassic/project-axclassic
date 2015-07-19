sub EVENT_SPAWN {
my $buffed = quest::saylink("buffed", 1);
       quest::say("There it is , straight ahead, thier encampment, tell me when you are $buffed for battle!");
       }
       sub EVENT_SAY {
       if ($text=~/buffed/i) {
     quest::say("To arms, now! Rush into the heart of the beast and emerge victorious, as we have discussed! Charge!");
     quest::follow($userid);
     }
}
sub EVENT_SIGNAL {
     if($signal == 7226){
     quest::say("Well done $name! Hand me your Mauled Acrylia Sphere you no longer need it.");
     quest::say("Remember to take all three documents and your Garrison cloak and combine them in the box Captain Darznel gave you and return the finished product to him.");
     quest::depop(167989);
     quest::depop(167990);
     }
}
sub EVENT_ITEM {
     if (plugin::check_handin(\%itemcount,120204=>1)) {
     quest::say("A fine Garrison you shall be $name.");
     quest::say("Thanks, I will reuse this for the next recruit that comes through.");
     quest::say("Fare well $name.");
     quest::ding();
     quest::exp(15000);
     quest::depop();
     }
}
sub EVENT_DEATH {
     quest::shout("Oh No! We have failed the mission!");
     quest::signalwith(167990,7224,0);
}     
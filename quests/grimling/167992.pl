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
     quest::say("Remember to take all three documents and your Garrison cloak and combine them in the bag Veteran Darznel gave you and return the finished product to him.");
     quest::say("I am headed back to the outpost. Fare well $Name");
     quest::exp(10000);
     quest::faction(132, 10);
     quest::depop(167989);
     quest::depop(167990);
     quest::depop();
     }
}
sub EVENT_DEATH {
     quest::shout("Oh No! We have failed the mission!");
     quest::signalwith(167990,7224,0);
}     
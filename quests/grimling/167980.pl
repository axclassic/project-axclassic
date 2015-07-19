sub EVENT_SPAWN {
my $buffed = quest::saylink("buffed", 1);
       quest::say("Ok, Beyond these rocks is thier second encampment, tell me when you are $buffed for battle!");
       }
       sub EVENT_SAY {
       if ($text=~/buffed/i) {
     quest::say("To arms, now! Rush into the heart of the beast and emerge victorious, as we have discussed! Charge!");
     quest::follow($userid);
     }
}
sub EVENT_SIGNAL {
     if($signal == 7216){
     quest::say("Well done $name! A fine Garrison you will make. I am going back to the outpost while you clean up around here.");
     quest::depop(167981);
     quest::depop(167982);
     quest::depop();
     }
}
sub EVENT_DEATH {
     quest::shout("Oh No! We have failed the mission!");
     quest::signalwith(167982,7214,0);
}     
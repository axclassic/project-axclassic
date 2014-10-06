sub EVENT_SAY {
my $out = quest::saylink("out", 1);
my $jumped = quest::saylink("jumped", 1);
my $lead = quest::saylink("lead", 1);
my $follow = quest::saylink("follow", 1);
if ($text=~/Hail/i) {
   quest::say("Greetings $name, I hope you have come to get me $out of this horride place.");
   }
   if ($text=~/out/i) {
   quest::say("Thank goodness, I have been a captive here for so long. I was on on my way to Freeport to report in when I got $jumped by these Goblin Captors. I don't know why or what they think I have on me that would be so important.");
   }
   if ($text=~/jumped/i) {  
   quest::say("There are too many monsters between here and the entrance for me to get by, would it be possible for you to $lead me back to the entrance? once I get there I am sure I would be fine.");
   }
   if ($text=~/lead/i) { 
   quest::say("Oh, Thank you! Just say the word when you are ready and I will $follow you.");
   quest::spawn2(340106,0,0,-156.8,-453.1,394.7,219.1);
   quest::spawn2(340107,0,0,1641,-608.3,112.7,0.1);
   }
   if ($text=~/follow/i) {
   quest::say("I will follow you as best i can be careful though, I would hate for you to loose me.");
   quest::follow($userid);
    }
   }
   sub EVENT_SIGNAL {
   if ($signal == 880) {
   quest::emote(' gives a quick kiss on the cheek to each of your party members.');
   quest::say("You have saved the life of an otherwise helpless being for no other reason than to show the captors that they cannot take hostages like this without consequences. Their penalty was death. Well done!");
   quest::say("Give this to the person who sent you to resque me, its all I have.");
   quest::summonitem(120167);
   quest::depop();
  }
}
   sub EVENT_DEATH {
   quest::say("Oh no!");
   quest::depop(340105); 
   quest::depop(340106); 
   quest::depop(340117); 
}
 

sub EVENT_SAY {
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
   }
   if ($text=~/follow/i) {
   quest::say("I will follow you as best i can be careful though, I would hate for you to loose me.");
   quest::follow($name);
   quest::spawn2(340105,-43.9,-459.5,294.7,202.2);
   quest::spawn2(340105,-43.5,-510.9,294.7,210.2);
   $client->Message(14,"You knew it was too good to be true! Two more of the Captors showed up just as you were about to leave. You let the other two know how powerful you really were, maybe it's time to do so again. But watch out, you don't want them to hurt the girl.");
   quest::spawn2(340106,1090.9,-464.3,143.4,189.5);
   quest::spawn2(340107,1641.6,-636.1,112.7,1.1);
   }
   }
   sub EVENT_SIGNAL {
   if ($signal == 880) {
   quest::emote(' gives a quick kiss on the cheek to each of your party members.');
   quest::say("You have saved the life of an otherwise helpless being for no other reason than to show the captors that they cannot take hostages like this without consequences. Their penalty was death. Well done!");
   quest::say("Give this to the person who sent you to resque me, its all I have.");
   quest::summonitem(120167);
  }
}
   sub EVENT_DEATH {
   quest::say("Oh no!");
   quest::depop(340105); 
   quest::depop(340106); 
   quest::depop(340107); 
}
 

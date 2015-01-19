sub EVENT_SIGNAL {
   if($signal == 229){
   quest::say("Oh no . . . I'd recognize the echo of those footfalls anywhere. That sounds like Krill . .");
   }
   if($signal == 231){
   quest::say("For my own knowledge and to bring some closure to this terror, can you bring me his head? I want to see with my own eyes. I need to know if it was him."); 
   }  
  }
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 52344 => 1)) {
   quest::emote('adjusts his spectacles and peers at the head');
   quest::say("True enough. This is a Wayfarer . . . Errr, was at one time. I imagine he renounced his membership in the Brotherhood sometime before he took up a career of tormenting a poor scholar. They must have been trying to get to Nedaria by coming after me. I am famliar with Krill and he is a follower, not a leader. Someone else is the mastermind behind this - a person with access to magical disguises to hide their identity.");
   quest::ding();
   quest::exp(4815250);
   quest::givecash(0,0,0,75);
   quest::depop();
  }
 } 
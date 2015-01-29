sub EVENT_SAY {
if($text=~/hail/i) {
   quest::say("$name! You are my savior. Thank you very much for saving me. I am afrasid I have nothing to offer you as a reward but my thanks. I need to depart. I still have some collecting to do.");
   quest::depop();
   }
 }
sub EVENT_SAY {
if($text=~/hail/i) {
   quest::say("$name! You are my savior. Thank you very much for saving me. Here is my Brooch, take it as a symbol of friendship from me to you. I need to depart. I still have some collecting to do.");
   quest::summonitem(69982);
   quest::depop();
   }
 }
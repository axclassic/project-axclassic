sub EVENT_SIGNAL {
  if($signal == 101 && $text=~/hail/i) {
   quest::say("Whew that was a close one! I shall have to study these schematics and see where I went wrong. Maybe if I build a new one that uses the correct kind of power source it would work better! Anyhow, why don't you stop these beasts at the source? If you go up to the main factory door and twist the very bottom rivet of the icon three times to the right, it will open. I doubt they have changed how this works. Good luck!"); 
   $client->Message(14,"You remember Nitram's words - 'three small turns to the right on the bottom most rivet should open the door'.");
   quest::depop();
   }
  } 

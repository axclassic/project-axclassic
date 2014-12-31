sub EVENT_SAY {
    if($text=~/hail/i) {
    quest::say("Are you here to help me? Yes, I feel the intent of your spirit. You must be careful, the evil beast that stole my necklace is ever near.");
  	quest::spawn2(293226,0,0,-53,-414.5,-431,24.5);
	quest::depop();
  }
 } 
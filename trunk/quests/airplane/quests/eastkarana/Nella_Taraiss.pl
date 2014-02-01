sub EVENT_SAY {

  if($text=~/hail/i) {
    if(quest::istaskactivityactive(13,2)) {
	quest::say("Thanks for contacting me. Your information on this matter has been most useful.");
	$client->Message(7,"The search for the Morticalidon won't end, not as long as entrepid explorers like you are on the trail. With this type of creature, you never know when or where you'll find it, but one thing is for sure -- finding this creature will be the most rewarding experience you'll ever have. In the meantime, here's payment for the time you spent searching.");
  quest::updatetaskactivity(13,2);
  }
    else {
      quest::say("I'm sorry, I have neither the time nor the patience to chat right now.");
    }
  }
}
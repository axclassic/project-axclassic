#The iksar slave is part of the shaman skull quest line number 6.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote(' peers up at you. His face is covered with grime and he shows scars from goblin whips. He shakes his head and goes back to his thoughts.');
  }
   if($text=~/name/i){
   quest::say(" I was once known as Digalis, but I have been here so long that I dont think a name matters anymore.");
 }
}

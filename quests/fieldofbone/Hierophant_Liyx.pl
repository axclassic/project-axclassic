sub EVENT_SAY {
my $aid = quest::saylink("aid", 1);
  if ($text=~/Hail/i){
    quest::say("Hello. You have caught me before I started another mission. What can I do for you? Do you need my $aid?");
  }	
  if ($text=~/aid/i){
  quest::say("If that is the case you must know what I specialize in. Bring me the stone, a mirrored gem, and two celestial essences. I will do the rest by helping you set your friend free.");
  }
 }
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 48028 =>1, 48033 =>1, 9650 =>2 )) {
    quest::exp(5000);
	quest::ding();
	quest::say("He is here now. Send him off to the next plane!");
    quest::spawn2(78228,78,0,2645.3,-3060.9,28.3,233.3);
  }
 }
sub EVENT_SIGNAL {
if($signal == 900) {
    quest::say("Now he is free. Take his essence which is now pure, and return to your Head Master. He will know what to do from here. As for me, I have other errands to tend to.");
	quest::emote(' finishes his words, he steps into the shadows and departs again.');
	quest::depop();
  }
}
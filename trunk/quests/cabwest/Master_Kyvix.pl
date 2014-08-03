#Marthor is a former pupil of Supreme Master Tynn, and helps us along on our Whistling Fists quest. Buying him 4 Trog Brews (sold in East Cabilis) will get him to open up to us.

sub EVENT_SPAWN {
$Brew = 0;
}

sub EVENT_SAY {
my $components = quest::saylink("components", 1);
my $third = quest::saylink("third", 1);
my $mission = quest::saylink("mission", 1);
my $Tynnonium = quest::saylink("Tynnonium", 1);
 if($text=~/hail/i){
  quest::emote("Quite busy!! Quite busy!! Things must be done. New $components to be collected!");
 }
  if($text=~/components/i){
  quest::say("Yes, yes!! I will need components from beyond the gates. I must find an apprentice of the $third rank.");
  }
  if($text=~/third/i){
  quest::say("If you truly be an apprentice of the third circle, then there is a Dark Binder skullcap to be earned. Take this sack and fill it with a creeper cabbage, a heartsting telson with venom, brutling choppers and a scalebone femur. When they are combined within the sack, you may return it to me with your third rank skullcap and and we shall bid farewell to the title of apprentice.");
  quest::summonitem(17024);
  }
  if($text=~/mission/i){
  quest::say("I have been waiting for a Nihilist to return. His name was Ryx and I fear his love of ale and the high seas has kept him from his mission. All I want you to do is find him. He should be disguised as a worker and he will give you a tome to bring to me. Return it with your Dark Binder Cap. I am sure that is simple enough for one as simple as you. Be sure to give him this.");
  quest::summonitem(12848);
  }
 if(($text=~/master tynn/i) && ($Brew == 1)){
  quest::say("Supreme Master Tynn was the only one that has even seen the weapon. I do not know its origin. I tell you though, you would need to be as powerful as he was to be able to wield the weapon. Only an Iksar of the last rung would be able to use it, come back and show me you have earned your $Tynnonium Shackle and I will discuss with you what I know.");
 }
 if(($text=~/Tynnonium/i) && ($Brew == 1)){
  quest::say("Veltar was one with the ways of Tynn. He did return to Cabilis, I know you have rescued him from his cell. He has traveled afar to clear his mind of his torture in the mines. He did not say where his travels would take him. You will have to find him once more and ask him about the Tynnonium Shackle he still wears.");
 }
}

sub EVENT_ITEM {
my $mission = quest::saylink("mission", 1);
if (plugin::check_handin(\%itemcount,4262=>1,12420=>1)){
quest::say("I demand a full fish sack and your third circle apprentice skullcap."); 
quest::say("You have taken far too long!! Already another apprentice has performed this task. You will still be rewarded with the Dark Binder skullcap, but now you must aid in a true $mission."); 
quest::summonitem(4263);
quest::faction(24,10);
quest::faction(193,10);
quest::ding();
quest::exp(10000);
quest::givecash(0,15,0,0);
 }
 elsif  (plugin::check_handin(\%itemcount,55978=>1,4263=>1)){
 quest::say("Well done $name, here is your Occultist Skullcap. You are on your way to being a true master!");
 quest::summonitem(4264);
 quest::faction(24,10);
 quest::faction(193,10);
 quest::ding();
 quest::exp(8000);
 quest::givecash(1,5,0,0);
 quest::say("To continue your quest I need the Kor Sha Candlestick. Speak with Keeper Rott, he may know of it's location.");
 }
  elsif  (plugin::check_handin(\%itemcount,12852=>1,12853=>1,4264=>1)){
 quest::say("So you are expecting to earn your way to rank of revenant, eh? You shall when I have the base and stem of the candle and your occultist skullcap.");
 quest::emote('grabs the candle parts and puts them in an odd pouch, then takes your cap which disintegrates in his palm. He hands you another cap.');
 quest::say("Welcome, Revenant $name. You have done well. The Harbinger awaits you. He seeks a new revenant.");
 quest::summonitem(4265);
 quest::faction(24,10);
 quest::faction(193,10);
 quest::ding();
 quest::exp(10000);
 quest::givecash(0,0,6,0);
 }
 elsif (plugin::check_handin(\%itemcount, 8348 => 4)){
  quest::say("Ha! How did you know my favorite drink? Master Rinmark told you? That crazy old monk spends his days sitting on that mountain in Timorous Deep doesn't he? And they call me a drunkard! Anyhow, I bet he told you about the Whistling Fists. I have never seen them myself, and have only heard legend passed down by [Master Tynn].");
  
  quest::settimer("Brew",300);
  $Brew = 1;
 }
 elsif (plugin::check_handin(\%itemcount, 4199 => 1)){
  quest::say("Ah, a monk of the final rung. You should seek Gandan Tailfist in Charasis. He, too, was seeking for a way to advance even further."); #Made this up, unable to find actual text
  quest::summonitem(4199);
  
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::say("I don't want that."); #Made this up
 }
}

sub EVENT_TIMER {
 if($timer eq "Brew") {
  quest::stoptimer("Brew");
  $Brew = 0;
 }
}

#Submitted by: Jim Mills
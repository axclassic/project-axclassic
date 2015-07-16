sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, friend. May I be of assistance?");
  }
}
sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 8471 =>1 )) {
     quest::say("'Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
     quest::say("Take this Polished Acrylia Sphere and give it to Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.");
     quest::summonitem(3681);
     }
}
#END of FILE Zone:grimling  ID:Not_Found -- Captain_Darznel
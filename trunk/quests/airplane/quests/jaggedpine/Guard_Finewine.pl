#zone - jaggedpine
#badge of honor subquest
#site3op

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Yeah. Hi. Lovely place this. Humid, dark, wild animals all over the place, man eating plants, snakes and bugs finding their way into my armor and biting me where a man ought not be bit. And if [Bossamir] is right, we're soon to be cut down by ravaging gnolls. Why-oh-why did I get assigned to this job? Why wasn't I assigned to Qeynos where a man can get a decent meal and sleep in a nice bed at night? Oh I'm sorry. Did I say that out loud?");
  }
  if($text=~/what bossamir/i){
    quest::say("Hmm. . . Yeah, I have this tendency to prattle on when I'm completely miserable. According to what my colleague Bossamir has heard, these gnolls may be tougher then we thought. But that would be par for the course anyway with the way my pitiful life is going. Woe is me. The people in this backward settlement hate me, Sergeant Caelin hates me and I assume Kane hates me too because he sent me to the armpit of Antonica on a suicide mission.");
  }
  if($text=~/How about some pate/i){
    quest::say("Oh yes! That would be great. Bring me some Pate and let me see that warning again and maybe I can actually read the whole thing without feeling faint.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 8283 == 1)){
    quest::say("So he wants to send me to jail simply because I'm not filling out some silly reports? How can I be expected to think in such a decrepit state? Maybe you could help me. If I had a meal worthy of someone of my breeding then maybe I could think. Bring me something elegant, I don't want anything dull and pedestrian. I don't know what I want though. Do you have any suggestions?");
  }
  elsif(plugin::check_handin(\%itemcount, 8199 == 1)){
    quest::say("Hmm. . . This is interesting. . . The tast is very refined but sort of. . . odd. . . We're almost there but I don't think you have the recipe quite right. Rather than that peassant Brandy, use this in your recipe instead. And rather than whatever other 'meat' you were using before use a Panther Liver. You do seem to have some skill as a chef, mayhaps you could work for me some day. Prepare some Panther Pate for me. Give me the Panther Pate and let me read that warning again.");
  }
  elsif(plugin::check_handin(\%itemcount, 8198 == 1)){
    quest::say("Hmm. . . This is interesting. . . The tast is very refined but sort of. . . odd. . . We're almost there but I don't think you have the recipe quite right. Rather than that peassant Brandy, use this in your recipe instead. And rather than whatever other 'meat' you were using before use a Panther Liver. You do seem to have some skill as a chef, mayhaps you could work for me some day. Prepare some Panther Pate for me. Give me the Panther Pate and let me read that warning again.");
  }
  elsif(plugin::check_handin(\%itemcount, 8278 == 1)){
    quest::say("Ah yes, this is perfect! I feel my head clearing already. Wait, is that the sun poking through the trees there or the moon? Hard to tell in this hideous jungle. . . Oh wait yes. My shift reports for the last few weeks. Why don't you go ahead and turn these into Sergeant Caelin for me. I'm going to enjoy this fine pate.");
    quest::summonitem("8279");
  }
}
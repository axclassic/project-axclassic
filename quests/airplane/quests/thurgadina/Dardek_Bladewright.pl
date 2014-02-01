# zone: thurgadina
# ax_peq

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Yeah, I'm Dardek. What d' ye want?! Can't ye see I'm not in t' mood fer talkin'? Bah, t' heck with ye. If'n ye get me a nice hot cup of m' favorite coffee, I might be willin' to talk with ye for a few minutes. Hurry up now, Coldain Coffee! It's t' only thing I'll drink!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 60289 => 1)){
    quest::say("Mmm, nothing like a nice hot cup of Thurgadin's best. Alright then, let's head over t' my shop and we can get down t' business!");
     quest::ding(); quest::exp(10000);
    quest::say("Alright then, what do ye have fer me? I'm certain ye didn't wake me up and make me coffee just t' see my glistening smile! What have ye got fer me?!");
  }
  if(plugin::check_handin(\%itemcount, 60285 => 1, 60286 => 1, 60288 => 1)){
    quest::say("Well now, looks like ye've done got yerself quite a selection there. Let me have a look at these things fer a minute.' Dardek works with the items in the forge briefly and then hands a completed sword to you. 'And there ye have it, your completed sword. Now if'n ye don't mind, I'm goin' t' head back and get some much needed sleep.");
     quest::ding(); quest::exp(10000);
    quest::summonitem("60292");
  }
}

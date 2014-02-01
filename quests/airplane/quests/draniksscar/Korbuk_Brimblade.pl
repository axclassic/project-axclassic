# Zone: draniksscar
# AngeloX

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say('Well now, arent you a meager one? Da name is Korbuk Brimblade. Have you felt anything strange lately?');
  }
  elsif($text=~/felt something strange/i){
    quest::say('Aha, you have sensed it as well. For a while, I believed it was just me dat noticed it. Now dat you have confirmed my suspicions, I am sure I can move forward with my [work].');
  }
  elsif($text=~/work/i){
    quest::say('Hmm, I am not sure if I should go into any more detail. After all, we have just met and I dont know how trustworthy you really are. Listen, if you really want to know what work I am involved with, I will need you to run a couple [errands] for me first, just so I know you are da real deal.');
  }
  elsif($text=~/errands/i){
    quest::say('You see, I had some things taken from me. I want to get dem back. I am very partial to my weapons, and had some great [plans] to make a sword dat would be unmatched by any other. I thought it would be nice to start da plans with my brethren by talking to some of dem about da tactics involved in creating a sword.');
  }
  elsif($text=~/plans/i){
    quest::say('Da sword was going to be made of da finest metal with a hilt dat is handcrafted by someone I am very close to. It was going to have my family seal engraved into da base of da blade and was to be my finest sword ever. But da plans were stolen by someone -- no doubt someone who oversees everything where I was working -- and I have yet to get them back. You look more than capable of recovering da plans for me. Hurry back when you have found dem.');
  }
  elsif($text=~/shank/i){
    quest::say('I found dis shank during a battle dat raged on for many weeks. It was solid and strong, perfectly balanced and had an aura of cunning like I never seen before. I took it and stored it away in my vault at home. One night while I was away, a gang of pirates aboard da Hates Fury plundered my home city and took da shank. I have heard dat it is in da hold of an undead pirate, long forgotten to da ages, so I need you to go recover it for me.');
  }
  elsif($text=~/what job/i){
    quest::say("I need the hilt, the blade and the plans taken to an ornery dwarf in the frozen tundra to the south. He hides among the coldain, mostly to keep himself drunk as much as possible. Unfortunately, he's the best person to combine the blade and the hilt into something I can use, so you need to find him and give him the three pieces. His name is Dardek.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 60285 => 1)){
    quest::say('Ahh, da plans! You really gave it to dat overseer, huh? Not too bad, I must say. You are not done yet though. There are still a couple errands left dat I need finished. You know da most important part of any sword is da blade it is forged from, right? Well, it is. I had da perfect [shank] ready and waiting for me.');
    quest::summonitem("60285");
  }
  elsif (plugin::check_handin(\%itemcount, 60286 => 1)){
    quest::say("You found it?! Did you slay da beast dat had it locked away too? You must have! Good work, you're really proving yourself nicely. There's some more work to be done though, so don't get too excited yet. Dis next errand is actually a favor I owe to a long time family friend. Perhaps you know of da Redblade family? Specifically, I'm talking about Kargek Redblade. He's in need of some help and you're da perfect person to help him. Just tell him I [sent you to help].");
  }
  elsif (plugin::check_handin(\%itemcount, 60288 => 1)){
    quest::say("Kargek must have been very appreciative, especially to give you a hilt dis fine. I know he gave dis to you, but since my sword is almost completed I thought I could use dis hilt to accompany my blade. I'll repay you, have no doubt about dat. I have everything I need now though, so there's just one more [job] I need you to do for me.");
    quest::summonitem("60288");
  }
  elsif (plugin::check_handin(\%itemcount, 60292 => 1)){
    quest::say("At long last, my sword is completed! It's fantastic and just as amazing as ever I thought it could be. Thank you so much for helping me realize my dream and for helping me complete this sword. Now I think you're ready -- if you're still willing -- to help me with some other [work] I have to get done. Since you've helped so much, why don't you keep hold of da sword for a while longer? I think you may find it will come in handy.");
    quest::summonitem("60293");
  }
  else{
    quest::say("I can't use this.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
      }
    }
}

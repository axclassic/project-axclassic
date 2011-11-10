#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Maps are a wonderful thing you know. Any time you find yourself lost you can hit BACKSPACE to view your map , try it.");
    quest::say("Come back later if you have time to [help].");
  }
  if ($text=~/help/i) {
    quest::say("Greetings $name. I've been trying to find some Gloomingdeep mushrooms for some potions I'm making, but I can't seem to find any. If you happen upon some I can make you a potion if you bring one to me.");
  }
}

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 59955 => 1)){
    quest::say("Excellent, Thank you, $name. Now I can finish my potions. Here take this sample I made earlier.");
    quest::summonitem("59765");
     quest::ding(); quest::exp(10);}
else {
quest::say("I have no use for this");
plugin::return_items(\%itemcount);}
}

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("The time has come for you to die!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("It is unwise of you to try that!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you attack me!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("The spirits will condem you!");
    }elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");}
}

sub EVENT_DEATH{
 quest::emote("'s corpse drops to the ground.");
 }

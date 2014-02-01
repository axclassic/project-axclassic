#zone - KerraRidge
#quest - Muxin's Sword
#Angelox 

sub EVENT_SAY {
  if ($text=~/hail/i){
    quest::emote("sighs heavily as he peers into the murky water.");
    quest::say("This is terrible, I've dropped my sword into the water and I can't swim! I don't suppose you could get it back for me $name? I can't very well fight the [undead] without a sword.");
    quest::say("While you're at it, you can brush up on your swimming skills here. Simply jump into the lake and use your direction keys to swim back and forth. You can also up PAGEUP to swim up and PAGEDOWN to swim down. Give it a try.");}
  elsif ($text=~/undead/i){
   quest::say("Aye the island across the water is full of them, I like to hunt there occasionally.");}
}

sub EVENT_ITEM{
  if ($itemcount{101} == 1){
    quest::say("Excellent, Thank you, $class. Now I can hunt the undead again. Here take this. I found it in yonder isle  earlier. You might need it.");
    quest::summonitem(102);
     quest::ding(); quest::exp(10); }
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

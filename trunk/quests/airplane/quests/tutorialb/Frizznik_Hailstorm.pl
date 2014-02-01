#zone: tutorialb
#Angelox
#rewrite by site3op

sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello there $name. The name's Frizznik and I'm in charge of making food for the revolt. Most of what I make starts with the basics. I don't have the time to make the basic items and the final products. Let me know if you are interested in [assisting] me with making dough.");
  }
  if($text=~/assisting/i) {
    quest::emote("eyes you up and down.");
    quest::say("Make sure you buy a mixing bowl and come see me when you are [ready].");
  }
  if($text=~/ready/i) {
    quest::say("Good enough. Now, combine these ingredients in your mixing bowl and return to me all the clumps of dough you can. If you give me four clumps of dough, I'll reward your assistance.");
    quest::summonitem(13087,20);
    quest::summonitem(13193,20);
    quest::summonitem(13088,20);
 }
}

sub EVENT_ITEM{
  if($itemcount{13090} ==4) {
    quest::say("I appreciate your assitance in getting everyone fed. Please take this as a small token of my eternal appreciation.");
    quest::summonitem(123);}
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

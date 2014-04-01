#zone: tutorialb
#quest: Flutterwing's sibling
#site3op

sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello there $name. Please don't hurt me, I may be the last of my lineage since the [theft]");
  }
  if($text=~/theft/i) {
    quest::emote("saddens and lets out a sigh.");
    quest::say("My unhatched siblings were stolen from our nest by a nasty kobold. I'm afraid the worst might have happened. Would you please search for the [eggs] during your journeys in the mines?");
  }
  if($text=~/eggs/i) {
    quest::say("Well of course they are eggs $class. How do you think us dragons are born? If you would return these eggs to me or what is left, I will reward you and  your group.");
  }
}

sub EVENT_ITEM{
  my @itemt = (38005,38173,38089,38110,38068,38194,38026,38152,38047,38215,38299,38236,38257,38278,38131,38320); ## All the rings random for bots reward.
  my $total3 = $itemt[ rand @itemt ];
   if($itemcount{54603} == 1) {
    quest::emote("beams with glee.");
    quest::say("Oh $name how can I ever repay such kindness. I will not be alone in this dreadful place after all. Please accept this small token.");
    quest::say("If I could get all the eqqs that were stolen...");
    quest::ding(); quest::exp(25);
    quest::summonitem($total3);
  }
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


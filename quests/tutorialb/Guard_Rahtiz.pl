#zone - tutorialb
#quest - Spider Tamer Gugan
#site3op

sub EVENT_SAY {
  if ($text=~ /Hail/i){
    quest::say("The Gloomingdeep spider tamer is able to brew anti-venom from a rare flower that grows in gloomingdeep. If we had this flower,we may be able to use it to save the lives of our comardes.");
  }
}

sub EVENT_ITEM{
  if ($itemcount{54604} == 1){
    quest::say("Well done $name! We shall start brewing right away.");
     quest::ding(); quest::exp(25);  }
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

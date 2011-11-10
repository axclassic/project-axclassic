sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I found a nice little hole in the wall and was able to form a bank vault from it. If youd like to store anything in there just let me know. OH and dont worry your items will transfer to any other bank you visit."); 
  }
}

sub EVENT_ITEM {
my $owner = $npc->GetOwnerID();
if ($owner > 0) {
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

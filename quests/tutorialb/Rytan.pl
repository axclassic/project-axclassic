#zone: tutorialb
#Revised Angelox

sub EVENT_SAY{
  if ($text=~/hail/i){
  quest::say("Hello. There are many things one can do with spells and you should take the time to learn them. If you wish I can [bless] you with the power of the gods using one such spell.");
}
elsif ($text=~/bless/i){
   quest::say("Very well ......... there you have been blessed.");
  quest::selfcast(5150);
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

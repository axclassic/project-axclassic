#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("There are many members of the revolt that can aid you as you combat the kobolds.  A new soldier like yourself won't last long without friends!");
    quest::say("The trick to talking to other adventurers is to go through proper channels.  No one likes a hothead who begs for coins by shouting at everyone in earshot. . .   But if you ask nicely, you can get others to team up with you on your adventures.");
    quest::say("The dangers of combat and the adventuring lifestyle can sometimes bring out the worst in people.  It's important to keep a cool head and only shout when absolutely necessary.");
    quest::say("Good luck out there, friend.  I'm sure you'll do fine!");
    quest::say("The command /shout will allow you to shout in a large radius. The command /ooc will allow you to talk out of character across the entire zone.  The /tell command is to allow you to talk to only one person without anyone else hearing it. The /say command lets you talk to others in your immediate area.");
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

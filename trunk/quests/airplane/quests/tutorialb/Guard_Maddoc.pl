#zone - tutorialb
#quest - Queen Gloomfang
#site3op

sub EVENT_SAY{
  if($text=~/Hail/i){
    quest::say("Queen Gloomfang spawns dozens of eggs every day. She must be stopped before the Kobolds can train and raise any more spiderlings. Venture into the spider tunnels and kill Queen Gloomfang. She lairs on a ledge high above the other spiders. You will recognize her perch by the thick stench of poison and decay. Once you destroy her, I can use an extract from her chitin to brew you a protective potion.");
 }
}

sub EVENT_ITEM{
  if($itemcount{14018} == 1){
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
     quest::ding(); quest::exp(500);  }
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

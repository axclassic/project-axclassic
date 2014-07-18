sub EVENT_SAY { 
my $member = quest::saylink("member", 1);
if($text=~/Hail/i){
quest::say("What business do you have here?!!  This here is the mine and that means if you ain't a $member of Miner's Guild 628, you'd best be moving on!!");
}
if($text=~/member/i){
quest::say("Don't take this personally,  but I can't quite trust you with such matters.  Maybe a few less Butcherblock bandits would prove your worth."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
  quest::say("I have no need of this, take it back.");
}
#END of FILE Zone:kaladimb  ID:67018 -- Jeet 

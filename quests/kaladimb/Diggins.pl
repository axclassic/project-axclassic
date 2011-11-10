sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("How is life treating you, bud?  What are you doing around the mines?  Either you are a [member of 628] or you are lost.  If you are lost, I can't help you.  I ain't no guide.");
}
if($text=~/i am a member of 628/i){
quest::say("Don't take this personally,  but I can't quite trust you with such matters.  Maybe a few less Butcherblock bandits would prove your worth."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb  ID:67017 -- Diggins 

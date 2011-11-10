sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome. warrior!  Show the Emerald Warriors your mettle and bring me a [ruined wolf pelt]. some [bat fur]. some [bone chips]. and a [spiderling eye] from the depths of Greater Faydark.  If you succeed. my admiration and a reward will be yours.  To battle!"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54089 -- Regren 

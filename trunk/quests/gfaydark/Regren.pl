sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome. warrior!  Show the Emerald Warriors your mettle and bring me a [ruined wolf pelt]. some [bat fur]. some [bone chips]. and a [spiderling eye] from the depths of Greater Faydark.  If you succeed. my admiration and a reward will be yours.  To battle!"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  if (plugin::check_handin(\%itemcount, 18782 => 1)) {
  quest::say("Welcome. young one! I see you show interest in the Emerald Warriors.  Wear this tunic as a sign that you have begun the training of our guild. Return to me when you are in need of futher training!");  # made up text
    quest::summonitem(13533);
	quest::ding();
	quest::exp(1000);
	quest::faction(92,10); #emerald warriors
	quest::faction(174,10); #kelethin merchants
	quest::faction(212,10); #merchants of felwithe
	quest::faction( 155, -30); #indigo brotherhood
	quest::rebind(54,278,339,77);
	}
	elsif (plugin::check_handin(\%itemcount,13073=>1,13782=>1,13253=>1,13069=>1)) {
    quest::say("Fine work! You are on your way to becoming an adequate combatant.");
    @randomGivenItems = (5013,5014,5015,5016,5019,5020,5021,5022,5023,5024,5025,5042,5043,5044,5045,5046,5047,5048,5049,5070,5071,6011,6013,6014,6015,6016,6030,6031,6032,6033,7007,7008,7009,7010,7021,7022,7023,7024);
    my $a = $randomGivenItems[int(rand(scalar @randomGivenItems))];
    quest::summonitem($a);
    quest::faction(92,10);
    quest::faction(155,-10);
    quest::faction(174,10);
    quest::faction(212,10);
    quest::exp(500);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:gfaydark  ID:54089 -- Regren 

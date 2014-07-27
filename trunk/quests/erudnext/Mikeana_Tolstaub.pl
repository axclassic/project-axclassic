sub EVENT_SAY {
if($text =~ /Hail/i) {
	quest::say("Welcome $name, I am Mikeana Tolstaub. One of many Cleric Guildmasters in Erudin.");
  }
}
sub EVENT_ITEM {
 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }

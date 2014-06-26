sub EVENT_SAY {
if($text =~ /Hail/i) {
	quest::say('"Mmmph!!  Who you? Not important, I am Bordag Guildmaster of Beastlord. You want to learn ways of beastlord or snack for my critter?');
 quest::say("If you have note... Give to me Now!!!");
 }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18846 => 1)){
    quest::say("Arhh.. Bordag bestest beastlord in all of world.. Bordag teach you..");
    quest::summonitem(13576);
	quest::ding();
	quest::exp(1000);
	}
else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  plugin::return_items(\%itemcount);
}
}
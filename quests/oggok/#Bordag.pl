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
	quest::rebind(49,1148,258,82);
	}
else {
  quest::say("Me can not eat dis... Take it back!");
  plugin::return_items(\%itemcount);
}
}
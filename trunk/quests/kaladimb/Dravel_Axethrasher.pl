
sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Well hello thar! It's good to see ya again, what can I do fer ye?");
 }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
   if (plugin::check_handin(\%itemcount, 36000 => 1)) {
  quest::say("Welcome to the Ragefury Berserkers. Through practice and battle you will learn to control your rage properly so that you are a formidable force on any field and against any foe. Take this tunic it will help protect you. When you need further training, see me.");
    quest::summonitem(36006);
	quest::ding();
	quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}



sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Well hello thar! It's good to see ya again, what can I do fer ye?");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 36000 => 1)) {
    quest::say("Welcome to the Ragefury Berserkers. Through practice and battle you will learn to control your rage properly so that you are a formidable force on any field and against any foe. Take this tunic it will help protect you. When you need further training, see me.");
    quest::summonitem(36006);
	quest::ding();
	quest::faction(169, 10); #Kazon Stormhammer
	quest::faction(314, 10); # Stormguard
	quest::faction(322, -30); # The Dead
	quest::exp(1000);
	quest::rebind(67,300,498,-33);
  }
 else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }
}



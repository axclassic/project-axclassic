
sub EVENT_SAY {
my $tome = quest::saylink("tome", 1);
my $S = quest::saylink("S", 1);
	if($text =~ /hail/i) {
		quest::say("If ye are ready to join the Axethrashers, read the note in yer inventory and then hand it to me.  Make sure to ask me about that $tome in yer inventory as well.  It will help you greatly during yer adventures.");
	}
	if($text =~/tome/i) {
		quest::say("In yer inventory ye will see a book called 'Tome of Corroded Axe'. This tome will allow ye to summon throwing axes to be used in combat. Hand me the book and I will teach ye a new disiplne.");
	}
	 if($text =~/free/i) {
		quest::say(" Talk to Tabber Varhund to recieve yer sample of components.");
	}
}
sub EVENT_ITEM {
my $free = quest::saylink("free", 1);
	if(plugin::check_handin(\%itemcount,36000 => 1)){
		quest::say("Welcome to the Axethrashers. Through practice and battle ye will learn to control your rage properly so that ye are a formidable force on any field and against any foe. Take this tunic it will help protect ye. When ye need further training, see me");
		quest::ding();
                quest::exp(1000);
		quest::summonitem(36006);
		quest::faction(169, 10); #Kazon Stormhammer
	        quest::faction(314, 10); # Stormguard
	        quest::faction(322, -30); # The Dead
		quest::rebind(67,300,498,-33);
	}
	elsif (plugin::check_handin(\%itemcount, 59892 => 1)) {
	        quest::addskill(51,1);
	        quest::say(" Call up your Combat Abilities window.");
		quest::say("Click on the $S located near the top right corner of the Combat Abilities window.  This will open the Combat Skills window.");
		quest::say("Your new skill, 'Corroded Axe' should now be displayed in the window.  Click on the name of the skill once, and then look at the bottom of the window.  Your should see a 'Make Hotkey' button.  Clicking on this will allow you to make a hotkey for your new skill.");
		quest::say("Place the new hotkey in one of the empty hotkey slots of the Combat Abilities Window.");
		quest::say("Remember to stock up on components if you wish to use your new skill and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to get one $free sample of components or to buy more tomes and components.");
	 }
	 else { 
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	plugin::return_items(\%itemcount);
	}
}

sub EVENT_SAY {
my $tome = quest::saylink("tome", 1);
my $S = quest::saylink("S", 1);
	if($text =~ /hail/i) {
		quest::say("If you are ready to join the Ireblood Ragers, read the note in your inventory and then hand it to me.  Make sure to ask me about that $tome in your inventory as well.  It will help you greatly during your adventures.");
	}
	if($text =~/tome/i) {
		quest::say("In your inventory you will see a book called 'Tome of Corroded Axe'. This tome will allow you to summon throwing axes to be used in combat. Hand me the book and I will teach you a new disiplne.");
	}
	 if($text =~/free/i) {
		quest::say(" Talk to Ritra Icyclaw to recieve your sample of components.");
	}
}
sub EVENT_ITEM {
my $free = quest::saylink("free", 1);
	if(plugin::check_handin(\%itemcount,36004 => 1)){
		quest::say("I am so thrilled you have chosen to join this regal and fearsome crew.  You will find that as a member of the Ireblood Ragers, you have a strong and proud force backing you. Now you must complete your first task.  Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		quest::say("I know that you may be nervous right now... after all, this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
                quest::ding();
                quest::exp(100);
		quest::summonitem("2873");
	}
	elsif (plugin::check_handin(\%itemcount, 59892 => 1)) {
	        quest::addskill(51,1);
	        quest::say(" Call up your Combat Abilities window.");
		quest::say("Click on the $S located near the top right corner of the Combat Abilities window.  This will open the Combat Skills window.");
		quest::say("Your new skill, 'Corroded Axe' should now be displayed in the window.  Click on the name of the skill once, and then look at the bottom of the window.  Your should see a 'Make Hotkey' button.  Clicking on this will allow you to make a hotkey for your new skill.");
		quest::say("Place the new hotkey in one of the empty hotkey slots of the Combat Abilities Window.");
		quest::say("Remember to stock up on components if you wish to use your new skill and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to get one $free sample of components or to buy more tomes and components.");
	 }
	elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
		quest::say("$name, citizen of Shar Vahl, accept this cloak as a symbol of your loyalty and service to our noble people. It will grow with you, young initiate, and like you it has incredible potential.  If you wish to complete further tasks, you should talk to Pashir.  Farewell.");
		quest::summonitem(2878);
                quest::ding();
                quest::exp(100);
	}	
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	plugin::return_items(\%itemcount);
}

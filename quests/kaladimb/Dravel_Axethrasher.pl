
sub EVENT_SAY {
my $tome = quest::saylink("tome", 1);
	if($text =~ /hail/i) {
		quest::say("If ye are ready to join the Axethrashers, read the note in yer inventory and then hand it to me.  Make sure to ask me about that $tome in yer inventory as well.  It will help you greatly during yer adventures.");
	}
	if($text =~/tome/i) {
		quest::say("In yer inventory ye will see a book called 'Tome of Corroded Axe'. I will give ye a new Container that you can make Basic Throwing Axes in.");
	}
	 if($text =~/sample/i) {
		quest::say(" Talk to Tabber Varhund to recieve yer sample of components.");
	}
	
}
sub EVENT_ITEM {
my $sample = quest::saylink("sample", 1);
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
	quest::summonitem(120199);
	quest::addskill(51,1);
	quest::say("Take this container and keep it safe.");
	quest::say("Inside this container add 1 of the Basic Axe Components.");
	quest::say("Hit the combine button and you will get 20 of the Basic Throwing Axes.");
	quest::say("Once you have the Throwing Axe, place it in your 'Range' Slot, thats the one where a bow would go.");
	quest::say("Now go to your 'Actions' window, and click on 'Combat Page'. Right click on a open slot and select 'Range Attack'. Got it?");
	quest::say("Move this new button to your hot bar, You can now Throw axes to pull mobs!");
	quest::say("well done $name! You must now practice your throwing to increase the skill.");
	quest::exp(500);
	quest::say("Remember to stock up on components if you wish to use your new container and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to get your $sample of components or to buy more tomes and components.");
	 }
	 elsif (plugin::check_handin(\%itemcount, 59893 => 1)) {
	quest::summonitem(120215);
	quest::ding();
	quest::say("Take this container and keep it safe.");
	quest::say("Inside this container add 1 of the Basic Axe Components.");
	quest::say("Hit the combine button and you will get 20 of the Blunt Axes.");
	quest::say("Once you have the Blunt Axe, place it in your 'Range' Slot, thats the one where a bow would go.");
	quest::exp(500);
	quest::say("Remember to stock up on components if you wish to use your new container and create some Blunt Axes.  You can visit the Berserker Tome Merchants in your home town to buy more tomes and components.");
	}
	 else { 
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	plugin::return_items(\%itemcount);
	}
}

sub EVENT_SAY {
my $tome = quest::saylink("tome", 1);
 if($text =~ /Hail/i) {
	quest::say("Me guild master of Da Bloodwolves.");
	quest::say("No time for talk, if you have someting fer me, give it!. Read the note in your inventory and then hand it to me.  Make sure to ask me about that $tome in your inventory as well. It will help you during your adventures.");
        }
if($text =~/tome/i) {
	quest::say("In your inventory you will see a book called 'Tome of Corroded Axe'. I will give you a new Container that you can make Basic Throwing Axes in.");
	}
 if($text =~/sample/i) {
	quest::say(" Talk to Luruk Dridor to recieve your sample of components.");
	}
}        

sub EVENT_ITEM {
my $sample = quest::saylink("sample", 1);
     if (plugin::check_handin(\%itemcount, 119870 => 1)) {
        quest::say("I will tell you if you if you are worthy of Da Bloodwolves!");
        quest::say("Haaah!! Cower befor the mighty Daboo!! Daboo make you feared.. make you powered! Dark power flow through you! Hate and Fear in your blood!");
 	quest::say("You want to be like Daboo? Ok, take dis and wear it. come back here when you kill some stuff $name.");
        quest::summonitem(13505);
	quest::faction(70,10); #Dark Ones
	quest::faction(292,10); #Shadowknights of Night Keep
	quest::faction(106,-30); #Frogloks of Guk
        quest::ding();
	quest::exp(1000);
	quest::rebind(52,130,238,-5);
	}
	elsif (plugin::check_handin(\%itemcount, 59892 => 1)) {
	quest::summonitem(120199);
	quest::addskill(51,1);
	quest::ding();
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
	quest::say("Remember to stock up on components if you wish to use your new container and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to buy more tomes and components.");
	}
 else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
    plugin::return_items(\%itemcount);
    quest::say("Me can not eat this, take it back.");
 }
}

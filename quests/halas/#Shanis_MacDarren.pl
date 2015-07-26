sub EVENT_SAY {
my $tome = quest::saylink("tome", 1);
        if($text =~ /Hail/i) {
	quest::say("Hello. I am the Guildmaster of the Bloodrage Brawlers. With my help, you will learn to control your rage and become a higly skilled fighter.");
	quest::say("If you are ready to join our guild, Read the note in your inventory and then hand it to me.  Make sure to ask me about that $tome in your inventory as well. It will help you greatly during your adventures.");
        }
        if($text =~/tome/i) {
		quest::say("In your inventory you will see a book called 'Tome of Corroded Axe'. Hand it to me and I will give you a new Container that you can make Basic Throwing Axes in.");
	}
        if($text =~/sample/i) {
		quest::say(" Talk to Boster MacHadden to recieve your sample of components.");
	}
}

sub EVENT_ITEM {
my $sample = quest::saylink("sample", 1);
       if (plugin::check_handin(\%itemcount, 36003 => 1)) {
       quest::say("I was hoping ye would see the wisdom of joining our fine guild.");
       quest::say("Now before ye take off on some fool quest and get yerself killed, take this tunic -- it's not much, but it will keep yer bones from freezing and give you a wee bit o' protection.");
       quest::say("There's much to be done in and around our fine city. I suggest that ye talk to Haladorf over there. Ye best get to work! Come back and see me as you gain experience and I'll train ye in our way.");
       quest::summonitem(36009);
       quest::ding();
       quest::faction(361, 10); #Wolves of the North
       quest::faction(213, -10); #Merchants of Halas
       quest::faction(294, -10); #Shamen of Justice
       quest::faction(311, 10); #Steel Warriors
       quest::faction(275, -30); #Rogues of the White Rose
       quest::exp(1000);
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
       quest::say("I have no need of this, take it back.");
       }
 }
 
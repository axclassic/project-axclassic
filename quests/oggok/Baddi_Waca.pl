sub EVENT_SAY {
$tome = quest::saylink("tome", 1);
my $yes = quest::saylink("yes", 1);
my $no = quest::saylink("no", 1);
 if($text =~ /Hail/i) {
	quest::say("Mmmph!!  Who you?  Oh. you $name.  You supposed to be promising Craknek.  I am Baddi Waca Guildmaster of berserker.  There bad things in swamp. Make sure to ask me about that $tome in your inventory as well.  It help you crush tings.");
	quest::say("You want help Crakneks or you want Guntrik bash your face!!?");
 }
 if($text =~/tome/i) {
	quest::say("In your inventory you got book called 'Tome of Corroded Axe'. This tome will allow you to summon throwing axes deez are gud so youse dont have to run up on every ting. Give me the book and I give you new Container that youse can make Basic Throwing Axes in.");
	}
	if($text =~/free/i) {
		quest::say(" Talk wit Sheerie Oglarum to get your sample of components.");
	}
	if($text =~/yes/i) {
	quest::say("Move this new button to your hot bar, You can now Throw axes to pull mobs!");
	quest::say("well done $name! You must now practice your throwing to increase the skill.");
	quest::exp(500);
	quest::say("Remember to stock up on components if you wish to use your new container and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to get one $free sample of components or to buy more tomes and components.");
	}
	if($text =~/no/i) {
	quest::say("ok we will go through it again".);
	quest::say("Take this container and keep it safe.");
	quest::say("Inside this container add 1 of the Basic Axe Components.");
	quest::say("Hit the combine button and you will get 20 of the Basic Throwing Axes.");
	quest::say("Once you have the Throwing Axe, place it in your 'Range' Slot");
	quest::say("Now go to your 'Actions' window, and click on 'Combat Page'. Right click on a open slot and select 'Range Attack'. Got it? $yes or $no");
        }
}
sub EVENT_ITEM {
my $free = quest::saylink("free", 1);
my $yes = quest::saylink("yes", 1);
my $no = quest::saylink("no", 1);
if (plugin::check_handin(\%itemcount, 119869 => 1)){ #Tattered Note
        quest::say("Arhh.. Baddi mighty berserker.. Baddi teach you to control rage.. you fight for Baddi now.");
        quest::summonitem(13505);
	quest::ding();
	quest::exp(1000);
	quest::rebind(49,-255,292,5);
}
elsif (plugin::check_handin(\%itemcount, 59892 => 1)) {
	quest::summonitem(120199);
	quest::addskill(51,1);
	quest::ding();
	quest::say("Take this container and keep it safe.");
	quest::say("Inside this container add 1 of the Basic Axe Components.");
	quest::say("Hit the combine button and you will get 20 of the Basic Throwing Axes.");
	quest::say("Once you have the Throwing Axe, place it in your 'Range' Slot");
	quest::say("Now go to your 'Actions' window, and click on 'Combat Page'. Right click on a open slot and select 'Range Attack'. Got it? $yes or $no");
	}
else {
  plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
  quest::say("me no need this.. Take back!");
  plugin::return_items(\%itemcount);
}
}
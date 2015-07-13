sub EVENT_SAY {
my $tome = quest::saylink("tome", 1);
	if($text =~ /hail/i) {
	quest::say("If you are ready to join the Ireblood Ragers, read the note in your inventory and then hand it to me.  Make sure to ask me about that $tome in your inventory as well.  It will help you greatly during your adventures.");
	}
	if($text =~/tome/i) {
	quest::say("In your inventory you will see a book called 'Tome of Corroded Axe'.  Hand it to me and I will give you a new Container that you can make Basic Throwing Axes in..");
	}
	if($text =~/sample/i) {
	quest::say(" Talk to Ritra Icyclaw to recieve your sample of components.");
	}
}

sub EVENT_ITEM {
my $sample = quest::saylink("sample", 1);
       if(plugin::check_handin(\%itemcount,36004 => 1)){
	 quest::say("I am so thrilled you have chosen to join this regal and fearsome crew.  You will find that as a member of the Ireblood Ragers, you have a strong and proud force backing you. Now you must complete your first task.  Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
	 quest::say("I know that you may be nervous right now... after all, this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
         quest::ding();
         quest::exp(1000);
	 quest::summonitem("2873");
	 quest::faction(175,10);
         quest::faction(2806,10);
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
       elsif(plugin::check_handin(\%itemcount, 2897 => 1, 2877 => 1)){
         quest::say("$name, citizen of Shar Vahl, accept this cloak as a symbol of your loyalty and service to our noble people. It will grow with you, young initiate, and like you it has incredible potential.  If you wish to complete further tasks, you should talk to Pashir.  Farewell.");
         quest::summonitem(2878);
         quest::summonitem(2877);
         quest::ding();
         quest::exp(500);
         quest::faction(175,1);
         quest::faction(2806,1); 
         }
      elsif(plugin::check_handin(\%itemcount,2897 => 1)){
        quest::say("This item means nothing to me by itself");
        quest::summonitem(2897);
        }
      elsif(plugin::check_handin(\%itemcount,2877 => 1)){
        quest::say("This item, by itself means nothing to me.");
        quest::summonitem(2877);
        }
      elsif (plugin::check_handin(\%itemcount, 59893 => 1)) {
	quest::summonitem(120200);
	quest::ding();
	quest::say("Take this container and keep it safe.");
	quest::say("Inside this container add 1 of the Basic Axe Components.");
	quest::say("Hit the combine button and you will get 20 of the Blunt Axes.");
	quest::say("Once you have the Blunt Axe, place it in your 'Range' Slot, thats the one where a bow would go.");
	quest::exp(500);
	quest::say("Remember to stock up on components if you wish to use your new container and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to buy more tomes and components.");
	}
	else{
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	plugin::return_items(\%itemcount);
	}
}

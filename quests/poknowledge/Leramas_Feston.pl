# Leramas_Feston (202048)
#Intermediate Stealth Manual


sub EVENT_SAY { 
	if($text=~/Hail/i) {
		quest::say("I hope your first teachings have taught you well, Kinil. It is time for your next lesson. The accumulation of knowledge requires exploration and study. If you explore the cave system in the Plane of Disease, you may eventually discover a foul being by the name of Rallius Rattican. You are to bring me his head, along with your Beginner Stealth Manual. Once done, we may proceed with your next lesson.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 28792 => 1, 29133 => 1)) {
		#Beginner Stealth Manual, Rattican's Head
		quest::say("Good work, $name. I must say I am quite impressed with your recovery of this. Clearly you have shown you are ready to begin your next lesson. Take this new book and when you are ready, speak to Ethoach Trokith. And remember, difficult tasks are put in our way not to stop us, but to call out our strength and resolve.");
		quest::summonitem(28793);#Intermediate Stealth Manual
        quest::exp(500000);
        $client->AddMoneyToPP(0,5,3,6,1);
	}
    else {
		quest::say("I don't need this."); #text made up
		plugin::return_items(\%itemcount);
	}
}#END of FILE Zone:poknowledge  ID:202048 -- Leramas_Feston 


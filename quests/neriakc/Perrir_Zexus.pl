######################################
## NPC: Perrir_Zexus                ##
## Zone: NeriakC                    ##
##  Cleric Guildmaster              ##
## Revised by caved for EQWorld     ##
## EQWorld Server   11-12-2010      ##
######################################
sub EVENT_SAY { 
my $symbol = quest::saylink("symbol", 1);

	if($text=~/Hail/i){
		$client->Message(14,"Salutations, $name! If you have a note please hand it to me so I can check if your devotion to our Lord Innoruuk is evident. As a member of the Spires of Innoruuk, you are required to obtain and wear the symbol of your station among the clergy. I can award you the hematite $symbol of Innoruuk worn by the initiates of the Spires.");
	}
	if($text=~/symbol/i){
		$client->Message(14,"The forest beyond the gates of our grand city has been shaped by the magic of our Lord Innoruuk to be more hospitable to our kind. There are halfling druids in the service of Karana who have set up shrines there in hopes of restoring the forest to its former state. They could never succeed in their task with their feeble powers granted by their insignificant god, yet still, they are a nuisance. Bring me four of the holy symbols worn by the druids and I shall grant you the initiate symbol of Innoruuk. If you feel you are not yet powerfull enough for such a grant task you should see High Priestess Alexandria first, for some further training");
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 14550 => 4)){#Woven Grass Amulets
		quest::emote("laughs. 'Here, take this then!  You are now and initiate of Innoruuk.  Speak with Ithvol K`Jasn for further advancement.'");#text made up
		quest::summonitem(1369);#Initiate Symbol of Innoruuk
	    quest::ding(); quest::exp(2000);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
}

    elsif(plugin::check_handin(\%itemcount, 18756 =>1)) {
        $client->Message(14,"Yes, $name!  I was told there was a new recruit comming my way. Take this rag. It will offer you some protection on the road my friend."); #note turnin
        quest::ding(); quest::exp(1000);
        quest::summonitem(13505);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr

}
  else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;

}
}


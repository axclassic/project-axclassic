# Shaman Epic 1.0
# Ooglyn
# Erud's Crossing (erudxing)
# Aramid September 2006
	
sub EVENT_SAY {
    if($text=~/hail/i) {
     quest::say("Ooooh, it you, $name. Me's been waitin for you cuz our frenz say you comin an need da test. So's I gib you da test. Hmm, now where me put it? Ooglyn been waiting for sign for so long dat me forget where me put test. Keep your eyes out for sign while me look for test. Oh, hey, $name, they gib you gem? I need dat gem, please, heheh.");
    }
	}
sub EVENT_ITEM {
my $ready = quest::saylink("ready", 1);
   if (plugin::check_handin(\%itemcount, 1666 => 1)) {
     quest::say("Ahhh, tank you, now me can...OH LOOK!! DA SIGN!!!! Oh, sorry you missed it. The sign show you where to wait for da test. Follow me...I like you so I take you there. We goin for a swim, $name!");
     quest::say("Tell me when you $ready.");
	 quest::faction(342,10);
     quest::ding();
	 quest::exp(10000);
	 quest::spawn2(98059,0,0,1639.4,-912.3,54.9,26.8);
	 quest::depop();
     }
}

# End of File - NPCID 98009 - Ooglyn
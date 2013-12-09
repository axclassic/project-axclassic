# Shaman Epic 1.0
# Ooglyn
# Erud's Crossing (erudxing)
# Aramid September 2006

sub EVENT_SAY {
    if($text=~/hail/i) {
     quest::emote("Ooooh, it you, $name. Me's been waitin for you cuz our frenz say you comin an need da test. So's I gib you da test. Hmm, now where me put it? Ooglyn been waiting for sign for so long dat me forget where me put test. Keep your eyes out for sign while me look for test. Oh, hey, $name, they gib you gem? I need dat gem, please, heheh.");
    quest::say("Ok, here is place for you to for waiting. Hab fun shaman!");
	quest::settimer(1, 200);
	}
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 1666 => 1)) {
     quest::say("Ahhh, tank you, now me can...OH LOOK!! DA SIGN!!!! Oh, sorry you missed it. The sign show you where to wait for da test. Follow me...I like you so I take you there. We goin for a swim, $name!");
     quest::say("Tell me when you $ready.");
	 quest::faction(342,10);
     quest::ding(); quest::exp(10000);
     quest::say("Ok shaman, let us be off.");
	 quest::spawn2(98046,0,0,4210.8,-1609.6,-289.4,181);
     quest::start(64);
	}
}
}



# End of File - NPCID 98009 - Ooglyn
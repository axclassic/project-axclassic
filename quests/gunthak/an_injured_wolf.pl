# an_injured_wolf SUGGESTED NPCID : 224250
# associated quest with Craegin_Coldtongue
# Beastlord spells created 9/6/2016
# by patrikpatrik

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount,59032 => 1)) {
		quest::emote("cringes as you lean forward, but visibly relaxes as it recognizes the stone in your hand. 
		You place the stone emblem into the clasp on the collar. The collar begins to glow softly and the beast 
		begins to look much healthier. he struggles to his feet and looks at you for a moment. He then lets out 
		a great howl that echoes in the caverns. He moves towards you and nuzzles your hand. You reach forward 
		and run you fingers across his head. As your fingers cross the collar, the wolf winks out of existence, 
		leaving you holding only only the softly glowing collar.");
		quest::summonitem(59033); # Receives Glowing Collar
		quest::depop();
	}
	plugin::return_items(\%itemcount);
}

#End of File NPCID:  Zone: Gunthak

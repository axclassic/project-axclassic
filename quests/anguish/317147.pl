##Transporter 317147 for use during the Overlord Mata Muram final stage##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
    }
sub EVENT_ENTER {
 		quest::ze(14,"You have been thrown from the chamber, hurry back to Overlord Mata Murams chamber and finish the job.");
		quest::movepc(317,587.9,3166.8,-13.4);
		quest::depop();
   }
 
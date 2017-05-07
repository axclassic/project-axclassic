##Transporter 317147 for use during the Overlord Mata Muram final stage##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
    }
sub EVENT_ENTER {
 		quest::ze(14,"You have been thrown from the chamber, hurry back to Overlord Mata Murams chamber and finish the job.");
		quest::movepc(317,587.9,3166.8,-13.4);
		quest::depop(317153);
		quest::spawn2(317138,0,0,507,4969,294.3,129.4);
		quest::depop();
   }
 
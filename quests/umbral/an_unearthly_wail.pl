# part of doomshade trigger
#
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 125, $x + 125, $y - 125, $y + 125);
	}
sub EVENT_ENTER {	
        $client->Message(14,"An unearthly wail fills the air as the Dark Masters begin chanting for the coming of doom."); 
        quest::depop();
    }
  
  

# EOF Zone: Umbral ID: 176105 NPC: an_unearthly_wail


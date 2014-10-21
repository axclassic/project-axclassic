sub EVENT_SPAWN {
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
    }
	sub EVENT_ENTER {
	$client->Message(14,"Time is short but you must take the energy crystal that has been left behind. Its use is unclear just yet, but the pulsating emissions that you can sense draws you ever closer to it." );
	$client->Message(14,"The crystal's deeply ensconced knowledge has shown you that there is one creator of the statues. This being is a direct underling to the great dragon of these isles, Yar`Lir. You must find this creator and slay him before he can bring to life any of his latest creations!"); 
	quest::depop();
	}

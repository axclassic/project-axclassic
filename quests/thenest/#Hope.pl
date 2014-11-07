sub EVENT_SPAWN {
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
    }
	sub EVENT_ENTER {	
$client->Message(14,"Those who enter have no chance, no hope.");
    }
sub EVENT_SAY {
my $Yes = quest::saylink("Yes", 1);
my $No = quest::saylink("No", 1);
   if($text=~/hail/i) {
   quest::say("Do you wish to live forever mortal? Answer me! $Yes or $No.");
   }
   if($text=~/Yes/i) {
   quest::say("You must destroy the Aspects in order to test your metal against T'Shara, you have 30 minutes.");
   quest::spawn2(383184,0,0,-1470.9,-467,-175.6,194.6);
    }
	if($text=~/No/i) {
   quest::say("I didnt think you were ready, Run along, I think I hear your mother calling you.");
  }
}

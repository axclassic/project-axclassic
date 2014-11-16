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
   quest::spawn2(343184,0,0,-1470.9,-467,-175.6,194.6);
   quest::signalwith(343184,310,0);
   quest::depop(343233);
   quest::depop(343234);
   quest::depop(343235);
   quest::depop(343236);
   quest::depop(343237);
   quest::spawn2(343177,0,0,-1705.5,-432.3,-178.4,54);
   quest::spawn2(343178,0,0,-1653.7,-653.4,-178.4,16);
   quest::spawn2(343179,0,0,-1540.9,-360.6,-177.8,181.6);
   quest::spawn2(343180,0,0,-1481.3,-673.1,-177.8,238.8);
   quest::spawn2(343223,0,0,-1601.2,-478.6,-179.1,243.6);
   quest::depop();
    }
	if($text=~/No/i) {
   quest::say("I didnt think you were ready, Run along, I think I hear your mother calling you.");
  }
}

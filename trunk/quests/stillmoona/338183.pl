sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
my $random_result = int(rand(100));
    if($random_result<=34){
    quest::say("More sand! We need more sand for the statue!");
    }elsif($random_result<=67){
    quest::say("Ignore the adventurers. We must complete the statue!");
    }elsif($random_result<=100){
    quest::say("Oops! I hope that didn't damage the statue.");
    }
  }
 


sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::emote(' casts a cold look upon you like something from the grave.');
    quest::say("Welcome to Broodlands may you fare better than I.");
 }
sub EVENT_SAY {
my $paid = quest::saylink("paid", 1);
my $retrieve = quest::saylink("retrieve", 1);
if($text=~/Hail/i) {
    quest::say("Hail stranger, you must be new to the area. it would be wise of you to study the area. I have a simple task for you and you might as well get $paid while you are exploring the area.");
    }
if($text=~/paid/i) {
    quest::say("Many years ago a group of giants stole from me some precious artifacts. As you can tell, I have been here a long time, waiting for travelers such as yourself that might be willing to $retrieve the artifacts for me. ");
    quest::depop(337254);
	quest::depop(337252);
	quest::depop(337253);
	quest::depop(337254);
	quest::depop(337250);
	quest::depop(337248);
	quest::depop(337247);
	quest::depop(337249);
	}
	if($text=~/retrieve/i) {
    quest::say("There are four artifacts in all, get them from the giants anyway you can and return them to me. I will glady pay you for your trouble.");
	quest::spawn2(337254,0,0,-553.9,-1030.9,77.2,239.6);
	quest::spawn2(337252,0,0,187,-910,71,240.1);
	quest::spawn2(337253,0,0,1261,501,32.1,238.8);
	quest::spawn2(337254,0,0,-838.6,782.7,37,165.3);
	quest::depop();
	}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119966 =>1, 119967 =>1, 119968 =>1, 119969 =>1 )) {
	quest::say("I can't believe my eye sockets! You managed to get my precious runes for me!");
	quest::say("Here is your payment..... Umm, I seem to have left my wallet in my other skin.");
	quest::exp(100000);
	quest::ding();
	}
 }
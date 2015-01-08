sub EVENT_SAY {
my $Water = quest::saylink("Water", 1);
my $challenge = quest::saylink("challenge", 1);
    if($text=~/Hail/i) {
     quest::say("Hello! I am the High Priest for the little village. I am in charge of communicating with our $Water God, Tiknonmanin.");
	}
    if($text=~/Water/i) {
     quest::say("Tiknonmanin is our one true god. He protects us when we need, and we give him tithing of fish and whatever else we find in the waters. I am the only one allowed to call him, but there are many who ask me to call him so they can give him their reverence. From time to time, someone comes to battle him in combat. He is very confident in his power, especially this close to the water, so he allows anyone who wishes to $challenge him.");
	}
	if($text=~/challenge/i) {
     quest::say("Well it has been some time. I guess I could allow a challenge, but you'll need to do something for me first. We've been having a tough time catching enough fish of late, and our bait supplies are running low. Bring us the meat from four ice burrowers. I'll call Tiknonmanin for you when you return.");
    }
  }
sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 19022 => 4)) { #Ice Burrower Meat
    quest::say("Thank you $name, Prepare yourself and venture into the waters, Tiknonmanin has accepted your challenge.");
    quest::spawn2(117090,0,0,170,515,-44,128.5);
	quest::depop();
  }
}  
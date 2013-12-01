sub EVENT_SAY {
my $oil = quest::saylink("oil", 1);
  if ($text=~/hail/i) {
    quest::say("Hello, there! Don't have time to talk. I'm workin', workin', workin'! Careful! Don't slip in the $oil!");
    }
  if($text =~ /oil/i) {
	quest::say("Ah the oil! I recently sent a specially crafted golem to explore through a huge portal to another plane. It's instructions were to collect special oil that I suspect existed in the plane. What I think is the golem broke down. This looks like a good task for one like you. Go see what's wrong with the golem. Here is spare gears of mine incase it's broken. Be careful though, if you put it in wrong it could explode or worse!");
	quest::summonitem(14319); 	
    }

sub EVENT_ITEM {
    #Return Oil Note handin:
  if (plugin::check_handin(\%itemcount, 18168 => 1)) {
    quest::delglobal("wizepicA");
    quest::setglobal("wizepicB",1,0,"F");
  }
      #Return Green Oil: 
  elsif (plugin::check_handin(\%itemcount, 14349 => 1)) {
    quest::say("Oh wow! You found the oil! Where is the golem? You didn't hurt him did you? I am very fond of him. Anyways, here is your reward a staff to give to that guy you were asking me about.");
		quest::summonitem(14339); #Staff of Gabstik 
		quest::faction(342, 30); #Truespirit
  }
  }
  plugin::return_items(\%itemcount);
}
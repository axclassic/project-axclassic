sub EVENT_SAY {
my $axe = quest::saylink("axe", 1);
	if($text=~/hail/i) {
      quest::say("Hail to you, feared one. I see the glint of rage in them eyes of yours there. One day you'll be able to recognize the same in others. I suppose now is the time to talk to you about the mirage around here. Tell you the truth, I wasn't able to beat it myself... that's why I'm out here and not establishing myself as a berserker.");
		quest::say("I wasn't meant for that path. I'm here to guide folk like yourself and help you gain control of the insane beast that lurks inside you. You must be prepared to fight one like yourself. All ye need are your wits, brawn, and skill, nought else. When you are ready give me the note McArik gave you and I'll send you to the training grounds.");
		quest::say("Return to me with the $axe that the Image wields and I shall give you that which McArik seeks");
		}
	if($text=~/axe/i) {
	    quest::say("The Axe of Souls is its weapon of choice. Return it to me as your proof of victory.");
    }
	}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 60195 => 1))	{
		quest::movepc(78,1065,525,176);
		quest::spawn2(78216,0,0,920,518,175,65);  #Berserker’s Image
		}
	
	elsif(plugin::check_handin(\%itemcount, 5658 => 1))	{
		quest::say("Hail, $name. Run along and give McArik the items he requested.");
        quest::summonitem(60196);
		}
}

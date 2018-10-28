## Master Glumr 15201 East Karana##
sub EVENT_SAY {
  my $call = quest::saylink("call", 1);
  my $corn = quest::saylink("corn", 1);
  
   if($text =~ /Hail/i && defined $qglobals{"Thanksturkey"} == 1) {
     quest::say("Hello $name. Look at this broken fence! Some of our turkeys heard a wild $call off in the distance and went crazy. They ran off with all of our corn.");
     }
   elsif($text =~ /call/i && defined $qglobals{"Thanksturkey"} == 1) {
     quest::say("Last night, right after sun down, an eerie call rose up from across the plain. I've never heard anything like it. At once, our turkeys went mad! They smashed through the fence, grabbed all the $corn, and ran off towards the east and across the bridge. I lost track of them after that.");
     }
   elsif($text =~ /corn/i && defined $qglobals{"Thanksturkey"} == 1) {
     quest::say("We're poor farmers--the only thing we have to trade is our turkey meat. Without corn, our turkeys will starve. If you can find some corn, you may be able to lure them into the open so that we can recapture them.");
     quest::say("Perhaps our friends in West Karana, might have a bit of corn that he will part with. Talk to Cleet Miller Jr. He is a friend of mine.");
     quest::delglobal("Thanksturkey");
     quest::setglobal("Thankscorn", 1, 5, "F");
    }
	else {
	quest::say("Do I know you? I dont talk to strangers.");
    }
 }	
 sub EVENT_ITEM {
    if ($itemcount{120330} == 1) { 
	quest::say("It's a miracle! Thank you so much, $name. With this food our turkeys are sure to live.");
	quest::say("Please take this note to my father to let him know of your great deeds!");
	quest::summonitem(120332);
	}
  }	
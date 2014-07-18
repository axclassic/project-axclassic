##Bronin Higginsbot, Misty Thicket, Avenger Battle Axe quest
##Quest by Aeolwind
    sub EVENT_SAY  {
	my $favor = quest::saylink("favor", 1);
   if($text=~/Hail/i) {
     quest::say("Hello.  It is dangerous out in the woods.  You should go to Rivervale.  It's at the end of the path.  You will find good times there.  Travel safely, my friend!");
    }
   if($text=~/shard/i) {
     quest::say("Searching for that blasted emerald shard, are you?  That thing has done nothing but bring me bad luck!!  I would gladly give it to you if you would do a small $favor for me.");
    }
   if($text=~/favor/i) {
     quest::say("I have been tracked here by a bounty hunter named Slaythe.  I have heard reports of his presence beyond the Great Wall.  Please seek him out and bring me some body part of his as proof of his passing.  Do this and the emerald shard is yours.");
     quest::spawn2(33146,0,0,77.7,1026.9,13.5,129.3);
    }
	   if($text=~/second/i) {
     quest::say("The second emerald shard was hidden in the forest near Kelethin. I heard one of the local guilds found it and now call it the Gem of Tunare. You will have to ask around in Kelethin about it. Good luck.");
 }
 }
   

    sub EVENT_ITEM {
	my $second = quest::saylink("second", 1);
    # Check for A Froglok Leg ID:12192
      if(plugin::check_handin(\%itemcount, 12192 => 1)) {
       quest::say("So I see you have defeated Slaythe. I shall sleep much better now that he is gone. I placed the emerald shard in one of the Highkeep strongboxes in Highpass. Give the bank clerk's assistant, Kiolna this key. There is a $second piece of the gem which I hid near Kelethin. You will need it to complete the gem. I hope it brings you better luck than I.");
       quest::faction(77, 3); #deeppockets
       quest::faction(218, 3); #merchants of rivervale
       quest::faction(31, -2); #Carson McCabe
       quest::faction(33, -2); #Circle of Unseen Hands
       quest::faction(48, -2); #Coalition of Tradefolk Underground
       quest::ding();
	   quest::exp(2000);
       quest::givecash(5,4,3,0);
       quest::summonitem(12193);#Give H.K. 106
       }
     else {
	 plugin::return_items(\%itemcount);
    }
}

sub EVENT_SAY {
my $third = quest::saylink("third", 1);
my $bidding = quest::saylink("bidding", 1);
my $embalming_fluid = quest::saylink("embalming_fluid", 1);
  if ($text=~/hail/i) {
    quest::say("You are on the grounds of the Brood of Kotiz. If you do not belong, you must leave at once. There shall be no $third rank skullcap for you.");  
  }
  if ($text=~/third/i) {
    quest::say("I offer the third rank apprentice skullcap to those who wear the second. If that is you, then you will do the $bidding of the tower.");
  }
  if ($text=~/bidding/i) {
    quest::say("Take this glass canopic. Within it you shall place a brain for me. The brain I seek is that of a sarnak crypt raider. Any shall do. The ones we seek should be near the Lake of Ill Omen. When you obtain the brain, you must quickly put it into the glass canopic with $embalming_fluid. When these are combined, the canopic shall seal and if you return it to me with your second rank skullcap, I shall hand you the next and final skullcap."); 
    quest::summonitem(17023);
    quest::say("You shall get no skullcap until I have the preserved raider brain and your second circle apprentice skullcap.");
  }
  if ($text=~/embalming_fluid/i) {
    quest::say("Embalming fluid is created through brewing, but do not drink it!! You can learn about the process of brewing on our grounds."); 
  }
  if ($text=~/speak/i) {
    quest::say("How dare you ask of such a thing! I am a Master of the Necromantic Arts.");
    quest::say("If you wish to have me conjure a spirit you must first seek out a traitor to our cause. His name is Ixzec. He can be found roaming with a group of renegades in a jungle not far from here.");
    quest::say("Return with his head and some items from the soul you want summoned and I will aid you in your request."); 
  }
}

sub EVENT_ITEM {
  # preserved sarnak brain && necro skull cap 2, gives skull cap 3
  if ($itemcount{12411}==1 && $itemcount{4261}==1) { 
    quest::say("You have done well. Here is your final apprentice skullcap."); 
    quest::ding();
	quest::exp(150); 
    quest::faction(193,20);
    quest::faction(24,20);
    quest::summonitem(4262);
    quest::givecash(0,0,10,0);
  }
  elsif ($itemcount{48021}==1 && $itemcount{48015}==1) { 
    quest::say("Ah, this brings me great joy. Now I shall have full control over this fool in his death. As for your request, here is what you asked for. . ."); 
    quest::emote(' you can see black smoke begin to arise from the cracks in the floor. In a bright flash of light, the spirit of Xyzith appears in front of you and attacks!');
	quest::spawn2(82106,82,0,0,793.1,294.9,46.2,207);
  }
  elsif ($itemcount{5136}==1) { 
    quest::say("You should return back to your brethren and give them the news of what has happened here young one. To make sure War Baron Eator recognizes the truth I shall give you my seal.");
    quest::summonitem(48020);	
  }
      else {
   plugin::try_tome_handins(\%itemcount, $class, 'Necromancer');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }  
}

#END of FILE Zone:cabwest  ID:3433 -- Master_Rixiz 


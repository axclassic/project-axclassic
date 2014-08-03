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
}

sub EVENT_ITEM {
  # preserved sarnak brain && necro skull cap 2, gives skull cap 3
  if ($itemcount{12411}==1 && $itemcount{4261}==1) { 
    quest::say("You have done well. Here is your final apprentice skullcap."); 
     quest::ding(); quest::exp(150); 
    quest::faction(193,20);
    quest::faction(24,20);
    quest::summonitem(4262);
    quest::givecash(0,0,10,0);
  }
      else {
   plugin::try_tome_handins(\%itemcount, $class, 'Necromancer');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }  
}

#END of FILE Zone:cabwest  ID:3433 -- Master_Rixiz 


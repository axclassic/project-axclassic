############
#NPC: Nesiff_Tallaherd
#Quest Name(s): Nesiff's Statue, The Crate
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Vesteri_Nomanoi, Guard_Weleth, Lieutenant Dagarok
#Items Involved: Claim Check ID:18012, Wooden Statue ID:13864, Crate of Defective Arrows ID:13925, Slip of Parchment ID:18824
#zone: qeynos

sub EVENT_SAY {  
  if($text=~/hail/i) {
    quest::say("Greetings, $name! Nesiff Tallaherd, owner and operator of Nesiff's Wooden Weapons, at your service. I am the finest woodworker in all of Qeynos. Even the Qeynos Guard uses my arrows, thanks to [Guard Weleth].");
  }
  if(($text=~/who guard weleth/i) || ($text=~/who is guard weleth/i)) {
    quest::say("Guard Weleth is like a son to me. He is responsible for purchasing supplies for the Qeynos Guard. He buys arrows from me. He is usually stationed near the North Gate.");
  }
}

sub EVENT_ITEM {
  # Claim Check ID:18012
  if(plugin::check_handin(\%itemcount, 18012 => 1)) {
    quest::say("Oh. Vesteri sent you? Here you go. I hope Te'Anara likes it.");
  # Wooden Statue ID:13864
    quest::summonitem(13864);
    quest::ding(); quest::exp(250);
    quest::faction(218,10);	#merchants of qeynos
    quest::faction(33,-30); #circle of unseen hands
    quest::faction(9,10); 	#antonius bayle
    quest::faction(47,10); 	#coalition of tradefolk
    quest::faction(135,10); #guards of qeynos
  }
  # Crate of Defective Arrows ID:13925
  if (plugin::check_handin(\%itemcount, 13925 => 1)) {
    quest::say("Oh dear. I hope my mistake will not bring too much grief down on poor Weleth. He was told not to order arrows from me after the last time I fouled up their shipment. But Weleth knew I needed the account to stay in business. Could you please rush this new invoice to him right away? Thank you.");
    # Slip of Parchment ID:18824
    quest::summonitem(18824);
    quest::ding(); quest::exp(250);
    quest::faction(218,10); #merchants of qeynos
    quest::faction(33,-30); #circle of unseen hands
    quest::faction(9,10); 	#antonius bayle
    quest::faction(47,10); 	#coalition of tradefolk
    quest::faction(135,10); #guards of qeynos
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
# EOF zone: qeynos ID: 1098 NPC: Nesiff_Tallaherd



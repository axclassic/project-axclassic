sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, friend. May I be of assistance?");
  }
  if ($text=~/wolves/i) {
quest::say("The wolves that I speak of have no need for sight. They are products of the darkness that surrounds us. Their ability to move in the darkness and attack in packs makes them a serious threat to any Vah Shir that walks beyond our city's gates. I fear them more than I fear the twisted little people that live in the caves around here. It is the duty of each citizen to help control the number of these creatures. Fill the bag that I just handed you with the jawbones of two young sonic wolves and I'll know that you have a real understanding of the ferocity of those creatures. If you return, I'll have something that you may find interesting.");
 quest::summonitem(17112);
 }
}
sub EVENT_ITEM {
my $wolves = quest::saylink("wolves", 1);
if (plugin::check_handin(\%itemcount, 6265 =>1 )) {
  quest::say("Ah so there you are we've been expecting you. Take this spear and go speak with Arms Historian Qua. He can provide further instructions.");
  quest::summonitem(6147);
}
elsif (plugin::check_handin(\%itemcount, 6157 =>1 )) {
  quest::say("How was your little encounter with those beasts? Quite nasty in combat, eh? I told you as much. Well, now that you've seen them firsthand, go to Arms Historian Qua and purchase the tomes on Wolf Bane Lore or something like that. He'll know what you mean. You can use those books and the Resactive Sealant Soak to make a weapon that offers considerable power against those wolves. Once you have the weapon, bring it to me with your apprentice cloak.");
  quest::faction( 132,10 );
  }
elsif (plugin::check_handin(\%itemcount, 5544 =>1, 6268 =>1 )) {
  quest::say("Well done #name!  You have proven your worth and can now be considered a Dar Khura Journeyman!");
  quest::say("Take your spear and this cloak, wear it with pride $name!");
  quest::say("To further your studies, you much venture to Hollowshade Moor and seek out Ahom Guzhin. He will instruct you on what is further needed.");
  quest::summonitem(6268);
  quest::summonitem(6267);
  quest::exp(10000);
}
else {
    plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Amat_Iuziq



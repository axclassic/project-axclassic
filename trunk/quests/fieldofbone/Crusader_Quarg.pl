#Quests covered in this file:
#Shaman Skull Quest 3
#Shaman Skull Quest 4

sub EVENT_SAY
{
   #Shaman Skull Quest No.3 Event_Say
   if($text=~/collect/i) {
      quest::say("Seek out Mystic Dovan in the swamp garrison, he will have information of the Crusaders.");
   }
}

sub EVENT_ITEM {
my $collect = quest::saylink("collect", 1);
   #give Crusader Quarg the note that Hierphant Zand gave to you
   if(plugin::check_handin(\%itemcount, 18054 => 1)) {
      quest::say("Ah, i see you have proven yourself to Zand and he wishes to see more of your prowess.  Go to the Tower of Kurn and bring him the Skulls of the Caste of Bone Brethren, a caste of powerful shamans who perished fighting undead in the Field of Bone several decades ago.");
      quest::faction(282, 10); #Scaled Mystics
      quest::faction(193, 10); #Legion of Cabilis
      quest::summonitem(17034); #Give the player a six slot container to combine the 5 skulls with an "X" in
      quest::exp(10000); #give decent xp...
  }

   #turn in the Full C.O.B.B. Chest and your Iron Cudgel of the Seer
   elsif(plugin::check_handin(\%itemcount, 12735 => 1, 5142 => 1)) {
      quest::say("The temple shall be pleased. As instructed by the Hierophants, here is your Iron Cudgel of the Mystic. You have done well. I must ask you to $collect the Crusaders of Rok Nilok. Take this chest. Inside you shall combine the skull of their leader and at least five of the caste members. You then will go to the Swamp Garrison and deliver the full chest and your Iron Cudgel of the Mystic to Mystic Dovan. Go to him now and inquire of the Crusaders of Rok Nolok.");
      quest::faction(282, 10); #Scaled Mystics
      quest::faction(193, 10); #Legion of Cabilis
      quest::summonitem(5143); #Give the player the Iron Cudgel of the Mystic
      quest::summonitem(17035); #Give the player A Skull Chest (C.O.R.N. Chest) to combine Tiny Glowing Skulls in
      quest::exp(100000); #give decent xp...
  }

   else {
      plugin::return_items(\%itemcount); #return items if not the ones required
   }
}
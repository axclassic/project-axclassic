# Shaman Epic 1.0
# Spirit Sentinel
# Emerald Jungle
# True Spirit Faction - Warmly
# Aramid September 2006

sub EVENT_SPAWN {
$item1 = undef;
}

sub EVENT_SAY {
my $might = quest::saylink("might", 1);
my $wasichu = quest::saylink("wasichu", 1);
my $find = quest::saylink("find", 1);
my $ear = quest::saylink("ear", 1);
my $rub = quest::saylink("rub", 1);
my $demise = quest::saylink("demise", 1);
my $began = quest::saylink("began", 1);

   if($text=~/started/i) {
    quest::say("This brings happiness to our hearts and we are grateful. However, we must ask you to walk one more path before you can become a true Heyokah. With trust, one can focus on what is important. With patience, one can perceive what is harmful. With wisdom, one can know what must be done. These, you have learned, yet without the might to carry out what must be done, all is for naught. Are you prepared to walk the path of $might?");
   }
   if($text=~/might/i) {
    quest::say("Good, good, Do you know this place, $name, this forest? The wasichu call it the Emerald Jungle, but we know it only as the terrible place. Where there is no spirituality, we are weak. The lost city in the middle of this jungle is a great void of belief not only absent of spirituality, but actually draining it from others. We are here to neutralize that void. The void is like the sky, and nothing escapes its gaze.");
    quest::me("If it senses us, it will drain us away and sometimes it turns our minds, making us like the $wasichu, crazy for things with no meaning.");
   }
   if($text=~/wasichu/i) {
    quest::say("Yes, there are some of us who have turned their backs on our world and struggle for possesions and power over others. These lost ones are our brothers and we cry for them. Our hearts are in pain like bleeding wounds when we think of them. The path of might will lead you to one of our lost brothers. We are afraid there is nothing we can do for him now, so you must eliminate him when you $find him.");
   }
   if($text=~/find/i) {
    quest::say("He left us long ago and walked the land for ages. He soon met a man, one of the pointy-ears that live underground. This man was like a void just like the one over that terrible place now. Our Brother-Friend was attracted to this man's desire and ambition. He no doubt thought that he could get what he wanted in service of this dark point $ear who denied his own creator.");
   }
   if($text=~/ear/i) {
    quest::say("After our brother began traveling with this point-ear, they became shrouded in a darkness we could not peer through. The point-ear was a powerful being and we soon lost their trail. We have no idea where he could be now. Although, after all these centuries, he has no doubt been gathering and cultivating his wealth and power. He must be an incredibly influential being at this point.");
    quest::me("Find this point-ear and draw our brother out, then destroy him and bring us proof. We await your return in somber mourning.");
   }
   if($text=~/heyokah/i) {
    quest::say("Yes, you have walked the Path of the Heyokah to its end. You have become what few have and we will now call to you as Heyokah $name. From now on, you are a direct link between the spirits and man. Whether your goals are to help us or master us, you are welcomed. Though there is little time for celebration. Do you feel the darkness of this place, the forest?");
    quest::me("To eyes not trained to see beyond physical appearances, it seems like any other forest. But you know, as do we, of the mantle over the city threatening all of us. We must $rub it out.");
   }
   if($text=~/rub/i) {
    quest::say("There are many such mantles scarring the universe and each is very different from the last. Removing them requires that we learn how they were created and go about reversing the damage done. We cannot enter under the mantle for long which is why we search out Heyokah such as yourself. We need you to enter the city and find out what you can about the city's $demise.");
    quest::me("We hope you will do this for the cause of balance but if you desire none but your own power, we shall grant that as well.");
   }
   if($text=~/demise/i) {
    quest::say("It was known as Torsis. During its history it amassed great wealth and power yet it eventually crumbled. No one understands what happened. The men of the world ask themselves how a nation as successful as Torsis could ever fall. Some blame plague, internal unrest, the constant encroachment of the forest, and marauding bands of monsters but we alone know what happened.");
    quest::me("Just as Tabien and Glaron lost sight of their spiritual paths, so did Torsis. Without the awe and inspiration of that which was greater than themselves, they eventually withered away. The mantle was born long before the last days, though, and what we need to learn is how it all $began.");
   }
   if(($text=~/began/i) && ($item1 == 1672)) {
    quest::say("Excellent! Go into the city and gather what evidence you can. The ghosts who still walk the streets may hoard precious memories that will aid us. Take this booklet and combine what you find in it. Then bring me the completed report. From there, we will know where to look next.");
    quest::summonitem(17805);
    $item1 = undef;
   }
 }
sub EVENT_ITEM {
my $started = quest::saylink("started", 1);
my $Heyokah = quest::saylink("Heyokah", 1);
my $lost = quest::saylink("lost", 1);
     if (plugin::check_handin(\%itemcount, 1668 => 1)) {
     quest::say("Ahh, you live, shaman! I am glad the beasts of this jungle haven't torn your body asunder. Tell me, do you still walk the path? Are you willing to continue what you have $started?");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
   }
    elsif (plugin::check_handin(\%itemcount, 1672 => 1)) {
     quest::emote("begins to weep softly as he sees the pelt, battered and bloody. After a few moments, he says, 'We can only hope his passing was quick and painless. The Dire was powerful and yet you overcame him. Always remember that when you became $Heyokah, it was the passing of a noble, yet misguided being that allowed you to do so. You should hold a special place in your heart for him and what he was in life.");
     quest::me("To help you remember him, we will fashion this pelt into a pair of boots and give them to you. With every step you take, you must think on the Dire, else his death be in vain forever.");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
     quest::summonitem(1678);
   }
    elsif (plugin::check_handin(\%itemcount, 3599 => 1)) {
     quest::say("Ahhh good, let us hope what you have found will point us in the right direction. Hmmm...this is interesting. It appears the disappearance of the first queen may have caused Rak'Ashiir's faith to decline. From there, the first King Rak laid down the groundwork for the city's eventual demise. We need to learn what happened to the queen. Perhaps bringing this knowledge to the King's now cursed form will lift the mantle.");
     quest::me("We've learned that the last lord of Torsis, Ghiosk, was a bit of a historian. Find him and see what you can learn about the queen. Take what you find to my brother here in the jungle beneath the murky waters of a pond.");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
   }
    else {
      quest::emote("will not take this item.");
      plugin::return_items(\%itemcount);
      return;
    }
   }


# End of File - NPCID 94052 - Spirit_Sentinel

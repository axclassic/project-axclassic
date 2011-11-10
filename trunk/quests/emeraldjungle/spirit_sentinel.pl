# Shaman Epic 1.0
# Spirit Sentinel
# Emerald Jungle
# True Spirit Faction - Warmly
# Aramid September 2006

sub EVENT_SPAWN {
$item1 = undef;
}

sub EVENT_SAY {
 if ($faction < 3) {
   if($text=~/started/i) {
    quest::say("This brings happiness to our hearts and we are grateful. However, we must ask you to walk one more path before you can become a true Heyokah. With trust, one can focus on what is important. With patience, one can perceive what is harmful. With wisdom, one can know what must be done. These, you have learned, yet without the might to carry out what must be done, all is for naught. Are you [prepared to walk the path of might]?");
   }
   if($text=~/might/i) {
    quest::say("Good, good, Do you know this place, $name, this forest? The wasichu call it the Emerald Jungle, but we know it only as the terrible place. Where there is no spirituality, we are weak. The lost city in the middle of this jungle is a great void of belief not only absent of spirituality, but actually draining it from others. We are here to neutralize that void. The void is like the sky, and nothing escapes its gaze.");
    quest::me("If it senses us, it will drain us away and sometimes it turns our minds, making us [like the wasichu], crazy for things with no meaning.");
   }
   if($text=~/wasichu/i) {
    quest::say("Yes, there are some of us who have turned their backs on our world and struggle for possesions and power over others. These lost ones are our brothers and we cry for them. Our hearts are in pain like bleeding wounds when we think of them. The path of might will lead you to one of our lost brothers. We are afraid there is nothing we can do for him now, so you must eliminate him when you [find him].");
   }
   if($text=~/find him/i) {
    quest::say("He left us long ago and walked the land for ages. He soon met a man, one of the pointy-ears that live underground. This man was like a void just like the one over that terrible place now. Our Brother-Friend was attracted to this man's desire and ambition. He no doubt thought that he could get what he wanted in service of this [dark point ear] who denied his own creator.");
   }
   if($text=~/dark point ear/i) {
    quest::say("After our brother began traveling with this point-ear, they became shrouded in a darkness we could not peer through. The point-ear was a powerful being and we soon lost their trail. We have no idea where he could be now. Although, after all these centuries, he has no doubt been gathering and cultivating his wealth and power. He must be an incredibly influential being at this point.");
    quest::me("Find this point-ear and draw our brother out, then destroy him and bring us proof. We await your return in somber mourning.");
   }
   if($text=~/heyokah/i) {
    quest::say("Yes, you have walked the Path of the Heyokah to its end. You have become what few have and we will now call to you as Heyokah $name. From now on, you are a direct link between the spirits and man. Whether your goals are to help us or master us, you are welcomed. Though there is little time for celebration. Do you feel the darkness of this place, the forest?");
    quest::me("To eyes not trained to see beyond physical appearances, it seems like any other forest. But you know, as do we, of the mantle over the city threatening all of us. We must [rub it out].");
   }
   if($text=~/rub it out/i) {
    quest::say("There are many such mantles scarring the universe and each is very different from the last. Removing them requires that we learn how they were created and go about reversing the damage done. We cannot enter under the mantle for long which is why we search out Heyokah such as yourself. We need you to enter the city and find out what you can about the [city's demise].");
    quest::me("We hope you will do this for the cause of balance but if you desire none but your own power, we shall grant that as well.");
   }
   if($text=~/demise/i) {
    quest::say("It was known as Torsis. During its history it amassed great wealth and power yet it eventually crumbled. No one understands what happened. The men of the world ask themselves how a nation as successful as Torsis could ever fall. Some blame plague, internal unrest, the constant encroachment of the forest, and marauding bands of monsters but we alone know what happened.");
    quest::me("Just as Tabien and Glaron lost sight of their spiritual paths, so did Torsis. Without the awe and inspiration of that which was greater than themselves, they eventually withered away. The mantle was born long before the last days, though, and what we need to learn is [how it all began].");
   }
   if(($text=~/all began/i) && ($item1 == 1672)) {
    quest::say("Excellent! Go into the city and gather what evidence you can. The ghosts who still walk the streets may hoard precious memories that will aid us. Take this booklet and combine what you find in it. Then bring me the completed report. From there, we will know where to look next.");
    quest::summonitem(17805);
    $item1 = undef;
   }
   if($text=~/ lost/i) {
    quest::say("The mantle was the product of thousands of faithless individuals. Not the single shroud we believed existed. Torsis is now truly cursed for all eternity as a great stain upon the universe. Today is a sad day, indeed. However, some good can still come of this. Your sacrifice and spiritual devotion in this matter have become legendary. You have waited for us at the bottom of the ocean. You have rubbed out a mighty rogue spirit.");
    quest::me("You have endured the black hole of Torsis and entered the a bode of Fear itself to save a child from eternal suffering. It is only fitting that we reward you with our greatest treasure, the [Spear of Fate].");
   }
   if($text=~/spear of fate/i) {
    quest::say("The spear was constructed millennia ago by Thalger, the first human Heyokah. One of the most destructive wasichu of Norrath, Miragul, as he is known, had been traveling the world searching out all known magic. Wherever he went, he discovered and experimented with all forms of dangerous magic. Most of the world cannot even fathom what the Arch Necromancer was capable of.");
    quest::me("He had haphazardly discovered a way to directly create a mantle of negative spiritual energy similar to what curses Torsis. He himself had willed into existence one of these [black holes].");
   }
   if($text=~/black holes/i) {
    quest::say("Miragul often retreated to the frigid northlands to experiment in solitude. It was here that he created a black hole. Unfortunately for the small tribes of men who made the northlands their home, this new black hole threatened not only their livelihood but their entire existence. The mantle was so powerful it not only drained the spiritual energy of everything within its gaze, it also drained the life force as well.");
    quest::me("The tribes were threatened with complete annihilation. But one [powerful shaman] stepped forward and struck against Miragul's mantle.");
   }
   if($text=~/powerful shaman/i) {
    quest::say("Thalger had been the first to pass our tests and the timing was lucky indeed. We supplied him with materials needed to construct a weapon that could pierce the very fabric of the [cosmos]. First, was the sharpened shoulder blade of an ancient lion matriarch. Then Thalger found a young sapling for the shaft and shaped it over the course of 45 days using nothing but his fingernails.");
    quest::me("He then split the top of the flexible shaft, lodged the blade into place and bound them together with the tanned entrails of an ox. Finally, he adorned the spear with the magical feathers of a an aviak elder.");
   }
   if($text=~/cosmos/i) {
    quest::say("Miragul's casting was strong but it was a force brought into existence. This force was positive in nature, the opposite of nothingness. Even though it worked like a void, it was still created by an imposition of will. We figured that if we could rupture the planar boundary and create enough anti-existence or non-matter, the mantle might destroy itself.");
    quest::me("Thalger volunteered immediately to pierce the mantle as no spirits could even get close to it. In one act of devotion and singular purpose, Thalger rode the wind far above the land and with one colossal arch ripped a [breach] across the planes.");
   }
   if(($text=~/breach/i) && ($item1 == 1674)) {
    quest::say("The tear in the fabric of existence created enough negative material to cancel out Miragul's abomination. Thalger's strike was so perfect that he cut just enough planar material to destroy the mantle and nothing else. Unfortunately, Thalger himself was lost in the process. All that was left was the spear that fell from the heavens to the ground where we recovered it.");
    quest::me("We have kept it since then and now we wish you to have it. When you strike with it, you must have the same singularity of purpose as did Thalger when he defeated Miragul's mantle.");
    quest::summonitem(10651);
    $item1 = undef;
    quest::depop();
   }
 }
 
 else {
     quest::emote("You are not yet worthy of this quest!!!");
      plugin::return_items(\%itemcount);
      return;
    }
}


sub EVENT_ITEM {
 if ($faction < 3) {
    if (plugin::check_handin(\%itemcount, 1668 => 1)) {
     quest::say("Ahh, you live, shaman! I am glad the beasts of this jungle haven't torn your body asunder. Tell me, do you still walk the path? Are you willing to [continue what you have started]?");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
   }
    elsif (plugin::check_handin(\%itemcount, 1672 => 1)) {
     quest::emote("begins to weep softly as he sees the pelt, battered and bloody. After a few moments, he says, 'We can only hope his passing was quick and painless. The Dire was powerful and yet you overcame him. Always remember that when you became [Heyokah], it was the passing of a noble, yet misguided being that allowed you to do so. You should hold a special place in your heart for him and what he was in life.");
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
    elsif (plugin::check_handin(\%itemcount, 18456 => 1, 18457 => 1, 18458 => 1)) {
     quest::say("Hmmm, it appears the queen's disappearance wasn't as random as we thought. It also looks as if this High Scale were having some sort of affair with Neh. We have little but speculation at this point, so making it known to Nak'Ashiir would do nothing. Perhaps finding the resting place of the High Scale will show us more of what really happened. We suspect the icon mentioned in this log could now be located in the city's old temple.");
     quest::me("Find the icon and bring it to Kirn, wherever he is. Tell us what you learn afterwards.");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
   }
    elsif (plugin::check_handin(\%itemcount, 18459=> 1)) {
     quest::say("So, the truth is found! Nak mourned over the loss of his child instead of relishing the blessing of his god, Cazic-Thule. His wife and the High Scale then abandoned him in disgust, but even that was an aftereffect of what caused the king to turn his back on his faith. The child is the key! If we put the child to rest, Nak may repent of what he has done and the mantle may be lifted.");
     quest::me("The most difficult task is now at hand. Find the child, then take proof of her passing to Nak. I can feel the mantle's foundation crumbling! Now, go!");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
   }
    elsif (plugin::check_handin(\%itemcount, 1674=> 1)) {
     quest::say("What is this? The scale of Rak'Ashiir's father? Then Rak has repented his mistake? But why is the mantle still in place? If Rak has repented, then the mantle should have dissolved since he was the one who initiated its construction. But is its initiation the key? How could we have been so blind? Kirn said Rak'Ashiir had the blood of his people on his hands but that is false.");
     quest::me("Rak merely pointed to a path that would lead them to destruction. It was the people who chose to follow. Now all [is lost].");
     quest::faction(342,10);
      quest::ding(); quest::exp(10000);
   }
    else {
      quest::emote("will not take this item.");
      plugin::return_items(\%itemcount);
      return;
    }
  }
   else {
     quest::emote("You are not yet worthy of this quest!!!");
      plugin::return_items(\%itemcount);
      return;
    }
}


# End of File - NPCID 94052 - Spirit_Sentinel

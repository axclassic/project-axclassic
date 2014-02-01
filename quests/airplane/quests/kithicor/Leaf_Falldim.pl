 #Ivy Etched Armor quest from Leaf Falldim in Kithicor
    sub EVENT_SAY {
        if($text=~/Hail/i){
          quest::say("Greetings. $name!  Respect the woods and all its inhabitants or face the wrath of the rangers.  Do not end up like [Maldyn Greenburn].");
        }
        if($text=~/maldyn greenburn/i){
          quest::say("Maldyn was once one of us.  He was the finest of archers.  Everyone aspired to be like him.  He soon was tempted to hunt.  The animals of these woods found themselves nothing more than moving targets for Maldyn's training.  We held a trial and exiled him to parts unknown.  He would take with him Morin's [Bow of Kithicor].  I was asked to find a worthy ranger to [retrieve the bow].");
        }
        if($text=~/bow of kithicor/i){
          quest::say("The Bow of Kithicor was carved from an ancient tree. It has great powers which were but a portion of the tree's mana. I seek a brave ranger to [retrieve the bow].");
        }
        if($text=~/retrieve the bow/i){
          quest::say("Search the lands of the Unkempt Druids in the Rathe Mountains.  I have heard of his arrows being found inside its territories and  of his death wish to hunt down its leader.  Retrieve the bow and return it to me and I shall give you the ivy etched gauntlets.");
        }
       if($text=~/i want to earn the ivy etched boots/i){
          quest::say("If you wish the Ivy Etched Boots, you shall do me a favor.  I am testing new arrow tips and wish a few of the hardest minerals I know of.  From the mines of the Temple of Solusek Ro, Ronium and from the land of mistmore fetch me Mistmoore Granite. Return these to me along with a guild offering of 2000 gold pieces.");
        }
       if($text=~/i want to earn the ivy etched leggings/i){
          quest::say("I will make you an offer.  If you be a ranger, as they are made for only a ranger, you must venture to Faydwer.  There you shall seek out Lieutenant Leafstalker of the Kelethin armor.  He sent a message of his retrievel of the quiver of kithicor.  Tell him you want it and return it to me.  Oh...and one more [small item].");
        }
       if($text=~/what small item/i){
          quest::say("Along with the quiver you shall journey to Erudin and purchase a Star of Odus gem to add to the quiver.  Consider the coins you shall spend an offering to the woods.");
        }
    }
    sub EVENT_ITEM {
        if(plugin::check_handin(\%itemcount, 12321 => 1, 12320 => 1)) {
         quest::summonitem(3190); #ivy etched gloves
         quest::say("Very good, you have brought justice to these lands.");
         quest::faction(182,+30); # kithicor residence
         quest::faction(265,+30); # protectors of the pine
         quest::faction(159,+30); # jaggedpine treefolk
         quest::faction(347,-60); # unkempt druids
          quest::ding(); quest::exp(10000);
        }
        elsif (plugin::check_handin(\%itemcount, 12305 => 1, 12306 => 1, $gold >= 2000)) {
         quest::summonitem(3192); #ivy etched boots
         quest::say("Very good, you have brought justice to these lands.");
         quest::faction(182,+30); # kithicor residence
         quest::faction(265,+30); # protectors of the pine
         quest::faction(159,+30); # jaggedpine treefolk
         quest::faction(347,-60); # unkempt druids
          quest::ding(); quest::exp(10000);
         }
        elsif(plugin::check_handin(\%itemcount, 12328 => 1, 10059 => 1)) {
         quest::summonitem(3191); #ivy etched leggings
         quest::say("Very good, you have brought justice to these lands.");
         quest::faction(182,+30); # kithicor residence
         quest::faction(265,+30); # protectors of the pine
         quest::faction(159,+30); # jaggedpine treefolk
         quest::faction(347,-60); # unkempt druids
          quest::ding(); quest::exp(10000);
        }else{
         plugin::return_items(\%itemcount);
         return 1;
         quest::say("What am I supposed to do with that?.");
    }
}
    # END of FILE Zone:kithicor  ID:20077 -- Leaf_Falldim - Finished by Aeolwind/Dibalamin

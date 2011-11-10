    sub EVENT_SAY {

    if($text=~/hail/i){
    quest::say("You [dare] to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away while you still can.");
    }
    if($text=~/dare/i){
    quest::say("So. you think you have what it takes to be a Scout of Tunare? Come back with 2 [gold] and 2 [rusty dagger]s and I'll make it worth your while.");
    }
    if($text=~/Gem of Tunare/i){
    quest::say("The bright green Gem of Tunare was discovered by the Scouts of Tunare in a trunk of a great tree. The lightning streaked down and split the tree in two and there was the gem , Tunare's gift to the people of Kelethin. It has no magical properties , but it represents the glory of Tunare. It appears as a small Emerald Shard. Alas , now it has been stolen by Faldor Hendrys and only his brother [Elmion Hendrys] could know of his whereabouts.");
    }
    if($text=~/Elmion/i){
    quest::say("Seek out the Feir'Dal, Elmion. He was last heard telling the local bar patrons that he was off to do some adventuring at the lake near the Estate. What that is, I do not know.");
    }
    }



    sub EVENT_ITEM {

      if (plugin::check_handin(\%itemcount, 54019 => 1)) {

        quest::emote("scans the note and sizes you up with a look.");

        quest::say("Very well then, I thank you for assisting us. You have shown great bravery in aiding in this mission. Keep this as a symbol of our friendship.");

        quest::summonitem(54022);

         quest::ding(); quest::exp(100); 

      }

      if(($gold >= 2) && (plugin::check_handin(\%itemcount, 7007 => 1))){

       quest::say("Well, well. I didn't think you could do it. Here's your cut and don't be surprised that it's not much because it's your first lesson. Remember. the smaller the operation. the bigger the share, and the richest rogues have the tightest lips.");

       quest::summonitem(7021);

       quest::givecash("0","5","0","0");

            quest::faction(283,5);

             quest::ding(); quest::exp(100);

      }

      #do all other handins first with plugin, then let it do disciplines

      plugin::try_tome_handins(\%itemcount, $class, 'Rogue');

      plugin::return_items(\%itemcount);

    }



    #END of FILE Zone:gfaydark  ID:54087 -- Tylfon - Edited by Aeolwind


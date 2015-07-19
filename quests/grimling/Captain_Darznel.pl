sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, friend. May I be of assistance?");
  }
}
sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 8471 =>1 ) && ($class eq "warrior")) {
     quest::say("'Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
     quest::say("Take this Polished Acrylia Sphere and give it to Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.");
     quest::say("After you complete that raid, please go with Scouts Danarin and Derrin. Once you secure those camps, bring me any grimling intelligence reports or documents that you may have found. Place the documents and your Garrison Cloak in this box and combine them. Bring the combined item back to me. Complete this task and you may even get a promotion.");
     quest::summonitem(3681);
     quest::summonitem(8411);
     quest::summonitem(120205);
     }
    elsif (plugin::check_handin(\%itemcount, 8471 =>1 ) && ($class eq "shaman")) {
     quest::say("'Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
     quest::say("Take this Polished Acrylia Sphere and give it to Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.");
     quest::say("After you complete that raid, please go with Scouts Danarin and Derrin. Once you secure those camps, bring me any grimling intelligence reports or documents that you may have found. Place the documents and your Garrison Cloak in this box and combine them. Bring the combined item back to me. Complete this task and you may even get a promotion.");
     quest::summonitem(3681);
     quest::summonitem(8412);
     quest::summonitem(120205);
     }
    elsif (plugin::check_handin(\%itemcount, 8471 =>1 ) && ($class eq "rogue")) {
     quest::say("'Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
     quest::say("Take this Polished Acrylia Sphere and give it to Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.");
     quest::say("After you complete that raid, please go with Scouts Danarin and Derrin. Once you secure those camps, bring me any grimling intelligence reports or documents that you may have found. Place the documents and your Garrison Cloak in this box and combine them. Bring the combined item back to me. Complete this task and you may even get a promotion.");
     quest::summonitem(3681);
     quest::summonitem(8413);
     quest::summonitem(120205);
     }
    elsif (plugin::check_handin(\%itemcount, 8471 =>1 ) && ($class eq "beastlord")) {
     quest::say("'Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
     quest::say("Take this Polished Acrylia Sphere and give it to Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.");
     quest::say("After you complete that raid, please go with Scouts Danarin and Derrin. Once you secure those camps, bring me any grimling intelligence reports or documents that you may have found. Place the documents and your Garrison Cloak in this box and combine them. Bring the combined item back to me. Complete this task and you may even get a promotion.");
     quest::summonitem(3681);
     quest::summonitem(8410);
     quest::summonitem(120205);
     }
    elsif (plugin::check_handin(\%itemcount, 8471 =>1 ) && ($class eq "bard")) {
     quest::say("'Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
     quest::say("Take this Polished Acrylia Sphere and give it to Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.");
     quest::say("After you complete that raid, please go with Scouts Danarin and Derrin. Once you secure those camps, bring me any grimling intelligence reports or documents that you may have found. Place the documents and your Garrison Cloak in this box and combine them. Bring the combined item back to me. Complete this task and you may even get a promotion.");
     quest::summonitem(3681);
     quest::summonitem(8409);
     quest::summonitem(120205);
     }
     elsif (plugin::check_handin(\%itemcount, 120206 =>1 ) && ($class eq "warrior")) {
     quest::say("This documentation is a great start. Judging by the amount of material here, we'll be able to formulate a new battle within the week. it shouldn't take our linguists too long to decipher this scribble.");
     quest::say("I cannot help but think that your presence and leadership are what made those missions such wonderful successes. I have been authorized to give you a field promotion for your valor and bravery in combat. Your ability to lead was the keystone in the success of those engagements. Welcome to the rank of Garrison Officer, $name.");
     quest::summonitem(8416);
     quest::ding();
     quest::exp(25000);
     }
     elsif (plugin::check_handin(\%itemcount, 120206 =>1 ) && ($class eq "bard")) {
     quest::say("This documentation is a great start. Judging by the amount of material here, we'll be able to formulate a new battle within the week. it shouldn't take our linguists too long to decipher this scribble.");
     quest::say("I cannot help but think that your presence and leadership are what made those missions such wonderful successes. I have been authorized to give you a field promotion for your valor and bravery in combat. Your ability to lead was the keystone in the success of those engagements. Welcome to the rank of Garrison Officer, $name.");
     quest::summonitem(8414);
     quest::ding();
     quest::exp(25000);
     }
     elsif (plugin::check_handin(\%itemcount, 120206 =>1 ) && ($class eq "beastlord")) {
     quest::say("This documentation is a great start. Judging by the amount of material here, we'll be able to formulate a new battle within the week. it shouldn't take our linguists too long to decipher this scribble.");
     quest::say("I cannot help but think that your presence and leadership are what made those missions such wonderful successes. I have been authorized to give you a field promotion for your valor and bravery in combat. Your ability to lead was the keystone in the success of those engagements. Welcome to the rank of Garrison Officer, $name.");
     quest::summonitem(8415);
     quest::ding();
     quest::exp(25000);
     }
     elsif (plugin::check_handin(\%itemcount, 120206 =>1 ) && ($class eq "shaman")) {
     quest::say("This documentation is a great start. Judging by the amount of material here, we'll be able to formulate a new battle within the week. it shouldn't take our linguists too long to decipher this scribble.");
     quest::say("I cannot help but think that your presence and leadership are what made those missions such wonderful successes. I have been authorized to give you a field promotion for your valor and bravery in combat. Your ability to lead was the keystone in the success of those engagements. Welcome to the rank of Garrison Officer, $name.");
     quest::summonitem(8417);
     quest::ding();
     quest::exp(25000);
     }
     elsif (plugin::check_handin(\%itemcount, 120206 =>1 ) && ($class eq "rogue")) {
     quest::say("This documentation is a great start. Judging by the amount of material here, we'll be able to formulate a new battle within the week. it shouldn't take our linguists too long to decipher this scribble.");
     quest::say("I cannot help but think that your presence and leadership are what made those missions such wonderful successes. I have been authorized to give you a field promotion for your valor and bravery in combat. Your ability to lead was the keystone in the success of those engagements. Welcome to the rank of Garrison Officer, $name.");
     quest::summonitem(8418);
     quest::ding();
     quest::exp(25000);
     }
     else {
     plugin::return_items(\%itemcount);
    }
}
#END of FILE Zone:grimling  ID:Not_Found -- Captain_Darznel
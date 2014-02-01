sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hello, my name is Phin. Practice, practice, practice.. That's my motto. It is my responsibility to train our members, and help them to advance their skills and abilities. I also reward our members with colored [Headbands] for completing certain tasks.");
}
if ($text=~/Tomer Instogle/i){quest::say("Tomer? I think Seta needs someone to go find him.. Go ask her.");
}
if ($text=~/WHeadbands/i){quest::say("Yes, I give the [White, Yellow, and Orange Headbands] to our newer members, and Togahn gives out [Red, Purple, and Blue Headbands] to our elder members.");
}
if ($text=~/[White, Yellow, and Orange Headbands]/i){quest::say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
}
if ($text=~/white headband/i){quest::say("That is our training headband.. Beginning students can earn this by slaying four [gnoll] pups, and bringing their scalps back to me.");
}
if ($text=~/gnoll pups/i){quest::say("Those vile creatures are constantly attacking our city.. and often killing innocent citizens. It is our duty to help defend Qeynos from their vicious raids.");
}
if ($text=~/yellow headband/i){quest::say("This is awarded to our students for helping clear out the evil that inhabits the old ruins of the Qeynos Hills. Just bring me back three putrid rib bones as proof of your good deeds and turn in your [training headband], and then I will give you the yellow headband.");
}
if ($text=~/training headband/i){quest::say("Yes, I give out [white, yellow, and orange headbands] to our newer members, and Togahn gives out [red, purple, and blue headbands] to our elder members.");
}
if ($text=~/orange headband/i){quest::say("This is a difficult award to obtain. The city of Qeynos is, as you know, under constant attack by the gnolls of Blackburrow. The Silent Fist Clan rewards its members who venture deep into this gnoll stronghold and bring swift justice to these vile creatures. Please return two Blackburrow gnoll pelts - make sure they aren't ruined - and a Blackburrow gnoll skin as proof of your noble actions. Also, turn in your [yellow headband], and then I shall give you the orange one. Good luck."); }
}
sub EVENT_ITEM { 
 if ($itemcount{13789} == 4){
	quest::say("Good job, $name, keep up the good work! Here is your white training headband. Wear it with honor, and make Lu'Sun proud.");
	quest::summonitem("10110");
	quest::faction("2082","1");
	quest::faction("10101","1");
	quest::faction("2030","1");
	quest::ding(); quest::exp("100");
 } elsif ($itemcount{13722} == 3 && $itemcount{10110} == 1){
	quest::say("Good work.. and, as promised, here is your reward. It is an honor to present this yellow headband to $name, for recent acts of courage and heroism, on behalf of the Silent Fist Clan.");
	quest::summonitem("10111");
	quest::faction("2082","1");
	quest::faction("10101","1");
	quest::faction("2030","1");
	quest::ding(); quest::exp("200");
 } elsif ($itemcount{13027} == 2 && $itemcount{13028} == 1 && $itemcount{10111} == 1){
	quest::say("It is an honor to present the orange headband of the Silent Fist Clan to one of our finest members, $name the mighty!");
	quest::summonitem("10112");
	quest::faction("2082","1");
	quest::faction("10101","1");
	quest::faction("2030","1");
	quest::ding(); quest::exp("300");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Monk');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:qeynos2  ID:2066 -- Phin_Esrinap 


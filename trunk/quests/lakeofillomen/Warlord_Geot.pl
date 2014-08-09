sub EVENT_SAY {
my $speak = quest::saylink("speak", 1);
my $search = quest::saylink("search", 1);
  if ($text=~/hail/i) {
    quest::say("Greetings!! You look like an adventurer. I have a bit of a problem with which you might be able to help. You see, there have been reports of sarnak hatchlings near the lake. I do not know why they are here, but I do know we need them exterminated. Here is the deal.. You bash them good and return their brains to me. For every four brains, I shall reward you.");
  }
  if ($text=~/duty/i) {
    quest::say("Very good to have you on board, Trooper $name! We have had reports of sarnak legionnaires attacking caravans. I shall require you to find these sarnak legionnaires. Take this pack. Fill and combine it with as many of their brains as will fit inside. Return the full pack to me and I shall consider you for a promotion.");
    quest::summonitem(17044);
  }
  if ($text=~/Xyzith/i) {
    quest::say("Warlord Xyzith was one of the Legion's most honored. He lead his troops into countless battles and never suffered a loss. He was sent out on this mission many say because his thirst for war had grown large. He vowed to bring back a metal so powerful that it would bring fear to those that laid eyes upon it.");
  }
  if ($text=~/metal/i) {
    quest::say("I wish I knew. I can't understand why he turned on us like that. I have since seen him in my dreams, or rather nightmares. He is not right and I will not believe that he is the same Xyzith I once knew.");
    quest::say("I did get a report a while back that said he was headed to the mines of Nurga, he had information that the legendary metal was being mined there.");
	quest::say("Since you are trying to find Xyzith for War Baron Eator, I would suggest starting your $search there.");
  }
  if ($text=~/communicate/i) {
    quest::say("That is a good question deserving of an answer. Go seek out members of brood with necromantic origin and see if any of them know how to $speak to the dead.");
  }
  if ($text=~/search/i) {
    quest::say("There was another report that said he had traveled to the Temple of Droga, there was one item that you did not find, it was a medal, a gift from myself to Xyzith when he bagan his travels.");
	quest::say("Find this medal and return it to me, I would like to have it as a keepsake");
  }
 } 

sub EVENT_ITEM {
my $Xyzith = quest::saylink("Xyzith", 1);
my $communicate = quest::saylink("communicate", 1);
  if (plugin::check_handin(\%itemcount, 12914 =>1 )) {
    quest::say("Very good. I cannot see any reason a warrior like you should waste their time on the patrols of a trooper. I shall recommend you for a promotion. I hope the War Baron agrees.");
    quest::ding();
    quest::exp(2000);
    quest::summonitem(18074);
    quest::faction( 193,1 );
    quest::faction( 30,1 );
    quest::faction( 282,1 );
    quest::faction( 62,1 );
    quest::faction( 317,1 );
  }
    elsif (plugin::check_handin(\%itemcount, 48016 =>1 )) {
    quest::say("This was the bracer of $Xyzith. . .I can only fear the worst now. Take this satchel with you. It was a gift from Xyzith when I first became a Warlord. Please find the rest of his remains and bring me the filled satchel again.");
    quest::ding();
	quest::exp(2000);
    quest::summonitem(48016);
	quest::summonitem(48014);
    quest::faction( 193,1 );
    quest::faction( 30,1 );
    quest::faction( 282,1 );
    quest::faction( 62,1 );
    quest::faction( 317,1 );
  }
  elsif (plugin::check_handin(\%itemcount, 48015 =>1 )) {
    quest::say("I see you have found all of his belongings. If only we could find a way to $communicate with him again to find out what information he found during his journey.");
    quest::ding();
	quest::exp(2000);
    quest::summonitem(48015);
	quest::faction( 193,1 );
    quest::faction( 30,1 );
    quest::faction( 282,1 );
    quest::faction( 62,1 );
    quest::faction( 317,1 );
  }
  elsif (plugin::check_handin(\%itemcount, 48027 =>1 )) {
    quest::say("Where did you find this?! No matter. This was the present I gave Xyzith when he first left on his final mission. Hmm, it seems as though there is a stone hidden inside of it.");
    quest::emote(' opens the medal and finds a Black Stone inside.');
	quest::say("Take this stone and see if you can find someone who knows more about it. Perhaps a shaman would kow something about this type of stone.");
	quest::say("I will send you Timorous Deep seek out Izatri, if anyone would know it would be her.");
	quest::exp(2000);
    quest::summonitem(48029);
	quest::faction( 193,1 );
    quest::faction( 30,1 );
    quest::faction( 282,1 );
    quest::faction( 62,1 );
    quest::faction( 317,1 );
  }
  
  plugin::return_items(\%itemcount);
}
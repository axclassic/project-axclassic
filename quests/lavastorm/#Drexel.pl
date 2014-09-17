sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::emote(' watches you closely with tired eyes.');
    quest::say("Welcome to Lavastorm Mountains. Watch your step.");
	}
sub EVENT_SAY {
my $task = quest::saylink("task", 1);
my $creatures = quest::saylink("creatures", 1);
my $rock = quest::saylink("rock", 1);
my $drakes = quest::saylink("drakes", 1);
my $Solusek_Ro = quest::saylink("elemental", 1);
my $crawlers = quest::saylink("crawlers", 1);

if (($text=~/Hail/i) && ($ulevel <= 20)) {
quest::say("Hail to you young traveler, my name is Drexel and I was sent out here to keep a safe path open between the gypsy camp and Najena. Though it sounds easy for someone like myself, it can be a very tiring $task.");
}
if (($text=~/Hail/i) && ($ulevel >= 21)) {
quest::say("Hail to you traveler, my name is Drexel and I was sent out here to keep a safe path open between here and Najena. I could not possibly ask for your assistance, I am sure your time is much too valuable. Please continue on your way, if you are looking for adventure, I would suggest checking the camps on the eastern wall I am sure they will have things that you could help them with.");
}
if (($text=~/task/i) && ($ulevel <= 20)) {
quest::say("Did you just say that you wanted a task to do? Let me see, I do have a few tasks that you can help me with. If you are willing I need help keeping the path free of some $creatures.");
}
if (($text=~/creatures/i) && ($ulevel <= 20)) {
quest::say("There are many creatures in Lavastorm but a few that always tend to sneak up on me are $rock dervishes, fire $drakes, lava $crawlers and fire $elementals. Which of these creatures would you like to help me with?");
}
if (($text=~/rock/i) && ($ulevel <= 20)) {
quest::say("Ah Good to here! Bring me four of the Essence of Dervish Rock as proof of your deeds and I shall reward you.");
}
if (($text=~/drakes/i) && ($ulevel <= 20)) {
quest::say("The path between the gypsy camp and Najena has to be kept safe for young adventurers to travel freely. Help keep the path clear by removing any fire drakes that you come across in the area.");
quest::say("Bring me four of the Essence of Fire Drake as proof of your deeds and I shall reward you.");
}
if (($text=~/elementals/i) && ($ulevel <= 20)) {
quest::say("Ah Good to here! Bring me four of the Essence of Fire Elemental as proof of your deeds and I shall reward you.");
}
if (($text=~/crawlers/i) && ($ulevel <= 20)) {
quest::say("The path between the gypsy camp and Najena has to be kept safe for young adventurers to travel freely. Help keep the path clear by removing any fire drakes that you come across in the area.");
quest::say("Bring me four of the Essence of Lava Crawler as proof of your deeds and I shall reward you.");
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 120147 => 1, 120147 => 1, 120147 => 1, 120147 => 1) && ($ulevel <= 20) {
quest::say("Well done $name!,That should help in keeping the path clear.");
quest::ding();
quest::exp(10000);
quest::givecash(0,2,3,4);
} 
elsif (plugin::check_handin(\%itemcount, 120148 => 1, 120148 => 1, 120148 => 1, 120148 => 1) && ($ulevel <= 20)) {
quest::say("Well done $name!,That should help in keeping the path clear.");
quest::ding();
quest::exp(10000);
quest::givecash(0,2,3,4);
} 
elsif (plugin::check_handin(\%itemcount, 120149 => 1, 120149 => 1, 120149 => 1, 120149 => 1) && ($ulevel <= 20)) {
quest::say("Well done $name!,That should help in keeping the path clear.");
quest::ding();
quest::exp(10000);
quest::givecash(0,2,3,4);
} 
elsif (plugin::check_handin(\%itemcount, 120150 => 1, 120150 => 1, 120150 => 1, 120150 => 1) && ($ulevel <= 20)) {
quest::say("Well done $name!,That should help in keeping the path clear.");
quest::ding();
quest::exp(10000);
quest::givecash(0,2,3,4);
}
    else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   } 
}
sub EVENT_SAY { 
my $Wisdom = quest::saylink("Wisdom", 1);
    if($text=~/Hail/i) {
    quest::say("Greetings, stranger. Have you come to partake in the Trial of $Wisdom?");
    }
	if($text=~/Wisdom/i) {
    quest::say("There are many riches to be had by those that possess the wisdom, strength, and perseverance to obtain them. It is my duty to give the Trial of Wisdom. Should you find the four scrolls of wisdom, return them to me and the trial shall commence.");
    }
 }
sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 49001 =>1, 49002 =>1, 49003 =>1, 49004 =>1 )) {
	quest::say("very well then $name, seek out Sung Li within this temple and he will start your Trial of Wisdom.");
	quest::spawn2(338176,0,0,222.3,460.1,-8.3,192.8);
	quest::depop();
	}
	else {
	plugin::return_items(\%itemcount);
    quest::say("These are not the Scrolls I asked you to find.");
   }
 }	
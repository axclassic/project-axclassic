###################################
# Part of the betrayal line quest #
# Resqu Miplez 			  #
# 4/17/13			  #
# Aanani_Rockfinder ID# 67043	  #
####################################

sub EVENT_SAY{
my $help = quest::saylink("help",1);
my $share = quest::saylink("share",1);
my $hammer = quest::saylink("Hammer",1);
my $made = quest::saylink("made",1);

if($text =~ /hail/i){
	$client->Message(14,"Hi! Welcome to the finest forge in all the world!");
}
if($text =~ /help/i){
	$client->Message(14,"So you want to know about crushing the magic stone? I don't just spread that around. But, you helped out a good friend so I think I can $share.");
}
if($text =~ /share/i){
	$client->Message(14,"Alright, so the first thing you need ia a Glyphed Smithing $hammer, a Celestial Essence, a forge. You will need about eight stones to create the amount of dust you need.");
}
if($text =~ /hammer/i){
	$client->Message(14,"I haven't seen one of those in ages. Even longer since I $made one, might not even remember the recipe.");
}
if($text =~ /made/i){
	$client->Message(14,"Sure I can tell you what I can recall. Let me see now... Ah I think it's four lightning copper bars and a hammer from the jury. You would smelt those together, then wrap the unfinished product with a torture hide in that box of yours. Well it is something like that, like I said it has been ages. Well, I have to get back to work so good luck and please come back and show me how you did I would love to see it again.");
}
}
sub EVENT_ITEM{

if ($itemcount{119804} => 1){
	$client->Message(14,"Well! Aren't you type of hero. Not bad, Not bad at all. How can I $help you?");
}
if ($itemcount{119805} => 1){
	$client->Message(14,"Good Work! Not as good as I would do of course. I guess it will do the trick though. If you ever find yourself in the sister city, you should see Tuggin, he enjoys all things on the halls. Oh before I forget!");
	quest::summonitem(119802);
	return 1;
}
else {
        
        plugin::return_items(\%itemcount);
	    return 1;
}
}

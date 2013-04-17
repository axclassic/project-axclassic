###################################
# Part of the betrayal line quest #
# Resqu Miplez 			  #
# 4/17/13			  #
# Vicar_Bytrau ID# 
####################################

sub EVENT_SAY{
my $thought = quest::saylink("thought", 1);
my $lord = quest::saylink("Lord", 1);
my $him = quest::saylink("him", 1);
my $proof = quest::saylink("proof",1);

if($text =~ /hail/i && $ulevel >= 65){
	$client->Message(14,"Good day $class. Pardon me, I am just busy in $thought.");
}
if($text =~ /thought/i){
	$client->Message(14,"Yes, I have been thinking about our $lord and how it appears he has betrayed us.");
}
if($text =~ /lord/i){
	$client->Message(14,"Others here are losing faith. However, I refuse to believe it is $him. No it just can not be.");
}
if($text =~ /him/i){
	$client->Message(14,"No! It must be corruption. It is the only way! How will I ever get the $proof?");
}
if($text =~ /proof/i && $ulevel >= 65){
	$client->Message(14,"I need proof! There must be some corrupution taken control of him. I need to think more on this, the fate of the clergy depends on it! Please leave me to my thoughts");
}
}

sub EVENT_ITEM{
my $found = quest::saylink("found",1);
my $reinforcing = quest::saylink("reinforcing",1);
my $weaken = quest::saylink("weaken",1);
my $crushed = quest::saylink("crushed",1);

if ($itemcount{119803} => 1){
	$client->Message(14,"By Marr! You have $found the very proof I need. I knew he has not betrayed us.");
}
if($text =~ /found/i){
	$client->Message(14,"You indeed deserve an award for your great deed. So in turn, I will tell you about $reinforcing the Betrayal Items.");
}
if($text =~ /reinforcing/i){
	$client->Message(14,"While in the Halls the items have drastically $weaken as time past in darkness and dispair.");
}
if($text =~ /weaken/i){
	$client->Message(14,"I am sorry I am rambling. If you take a simple item from Betrayal and add a couple of $crushed Glyph runes, you can increase their power.");
}
if($text =~ /crushed/i){
	$client->Message(14,"Personally, I do not know how to complete the process. However, I do someone who does. Her name is Aanina. She works at the best forge in Norrath, in the dirty little hole they call a city. Here take this to prove your friendship and my Marr guild you on your journey.");
 	quest::summonitem(119804);
    	return 1;
}
else {
   
        plugin::return_items(\%itemcount);
	    return 1;
}
}

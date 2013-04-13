## Betrayal Armor Quest ##
## Part 5 Lead you to Hate ##
## 4/13/2013 ##

sub EVENT_SAY{
my $Betrayal = quest::saylink("Betrayal", 1);
my $work = quest::saylink("work",1);
my $new = quest::saylink("new",1);

	if ($text =~ /Hail/i && $ulevel = 65){
 $client->Message(14,"Hello $class , I am very busy researching the Halls of $Betrayal.");
	}
	if ($text =~ /betrayal/i){
	$client->Message(14,"Yes it seems to have items that with some $work, they can become powerful.");
	}
	if ($text =~ /work/i){
	$client->Message(14,"For example, if you take a piece and combine it with four diamonds of a blue hue. Then you can restore a broke piece back to use. Afterwards you can add $new items to make it stronger.");
	}
	if ($text =~ /new/i){
	$client->Message(14,"Now that's what I am trying to find out the clerics in freeport have the information but refuse to share it.");
	else{
	quest::say("Excuse me I am busy reading. Can you not see!");
	}
}



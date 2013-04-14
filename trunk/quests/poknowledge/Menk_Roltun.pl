## Betrayal Armor Quest ##
## Part 5 Lead you to Hate ##
## 4/13/2013 ##

sub EVENT_SAY{
my $Betrayal = quest::saylink("Betrayal", 1);
my $work = quest::saylink("work",1);
my $new = quest::saylink("new",1);

	if ($text =~ /hail/i && $ulevel >= 65){
	$client->Message(14,"Hello $class , I am very busy researching the Halls of $Betrayal.");
	}
	elsif ($text =~ /betrayal/i && $ulevel >= 65){
	$client->Message(14,"Yes it seems to have items that with some $work, they can become powerful.");
	}
	elsif ($text =~ /work/i && $ulevel >= 65){
	$client->Message(14,"For example, if you take a piece and combine it with four diamonds of a blue hue. Then you can restore a broke piece back to use. Afterwards you can add $new items to make it stronger.");
	}
	elsif ($text =~ /new/i && $ulevel >= 65){
	$client->Message(14,"Now that's what I am trying to find out the clerics in freeport have the information but refuse to share it.");
	}
	else{
	quest::say();
	}
}



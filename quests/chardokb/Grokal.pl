## Betrayal Armor Quest ##
## Part 3 Lead you to Hate ##
## 4/13/2013 ##

sub EVENT_SAY{
my $secrets = quest::saylink("secrets", 1);
my $restored = quest::saylink("restored",1);
my $box = quest::saylink("box",1);

	if ($text =~ /Hail/i && $ulevel >= 65){
 $client->Message(14,"Hello $class , I have been hear a long time. I know many $secrets about this place and wish to share.");
	}
	if ($text =~ /secrets/i){
	$client->Message(14,"Yes Yes. I know that all the broken items in the place can be $restored to powerful objects.");
	}
	if ($text =~ /restored/i){
	$client->Message(14,"Yes sir, you can't do it without the $box though.");
	}
	if ($text =~ /box/i){
	$client->Message(14,"Find the one named Nox. He is filled with Hate but he maybe willing for alittle payment if you ask him about the box.");
	else{
	quest::say("I knew I should keep my secrets to myself.");
	}
}




#sub written by Kilelean
#Revised by Angelox for AXClassic 
sub DoRandomPatchwork {
	my $a;
	$a = int(rand(100)); 
	#Change the 20 in the if to change the % chance.
	if ($a <= 20) {
		quest::summonitem(quest::ChooseRandom(2104, 2106, 2108, 2111, 2112));#Patchwork Tunic, Patchwork Cloak, Patchwork Sleeves, Patchwork Pants, Patchwork Boots
	}
	else {
		#Do nothing
	}
}


sub EVENT_SAY {
my $tricksters = quest::saylink("pixie tricksters", 1);
my $exterminate = quest::saylink("exterminate the pixies", 1);
if($text=~/Hail/i){
$client->Message(14,"Hail. $name! I trust you are not afraid of heights. Kelethin is a grand city. but it is also a safe haven from predators and evil beings. About the only thing to fear are the $tricksters.");
}
if($text=~/pixie tricksters/i){
$client->Message(14,"An irritating lot of fairy folk. They have been starting fires in our great forest. They may just burn our grand community down. We will have to $exterminate. It is unfortunate. but it is for the good of the entire forest.");
}
if($text=~/exterminate the pixies/i){
$client->Message(14,"Faydark's Champions cannot call you foe. but you have yet to earn our trust."); }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12109 => 1)) {#Pouch of Pixie Dust
		$client->Message(14,"Good work. scout!!  You have earned this reward.  It is all we have at the time.  I am certain you are satisfied.  If not, then do not let me hear of it.");
		&DoRandomPatchwork();
		quest::givecash("0","2","0","0");
		quest::faction(283, 10);#Scouts of Tunare
		 quest::ding(); quest::exp(800);#10% of level 3 experience.  Newbie quest, being a bit generous compared to the guidelines.
	} 

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54104 -- Ran_Sunfire 

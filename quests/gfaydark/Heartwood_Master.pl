######################################
## NPC: Heartwood_Master            ##
## Zone: Gfaydark                   ##
##  Druid Guildmaster note turnin   ##
## Revised by caved for AXClassic   ##
## EQWorld Server     03-01-2011    ##
######################################
sub EVENT_SAY { 
if(($text=~/errands/i) && ($class == 'druid')) {
	$client->Message(14,"As druids of the Mother of All, we may only use the scimitar and blunt weapons, all other blades are forbidden. Prove your devotion by bringing me a rusty short sword, long sword, broad sword and bastard sword. I will destroy them and reward you for your faith. They will be reforged into weapons blessed by Tunare to assist the Soldiers in their defence of the Heartwood."); 
}
else {
	$client->Message(14,"Begone $class, you don't belong here!");
    return 1;
	}
}

sub EVENT_ITEM { 
my $errands = quest::saylink("errands", 1);

if (plugin::check_handin(\%itemcount, 18786 => 1) && ($class == 'druid') && ($ulevel == 1)) {
	$client->Message(14,"Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Here, put on this tunic, and let's get started.. you have much to learn. Go see Aliafya_Mistrunner for further training and don't forget to return to me later on to run some $errands\. ");
	quest::summonitem(13537);
	quest::ding();
	quest::faction(99, 10); #Faydark Champions
	quest::faction(178, 10); #King Tearis Thex
	quest::faction(304, 10); #Soldiers of Tunare
	quest::exp(1000); 
	quest::say("Be sure you find Soulbinder Oakstout in Kelethin and have yourself bound to the area before you venture out. Good luck $name.");
}
elsif (plugin::check_handin && ($class == 'druid') && (\%itemcount, 5013 => 1, 5016 => 1, 5019 => 1, 5022 => 1)) {
	$client->Message(14,"You have done well, child! Take this as a blessing from Tunare for doing her will.");
	quest::summonitem(5047);
	quest::givecash(0,0,5,0);
	quest::ding(); quest::exp(750);
	quest::faction(99,10); #Faydark's Champions
	quest::faction(178,10); #King Tearis Thex
	quest::faction(43,10); #Clerics of Tunare got better. 
	quest::faction(304,10); #Soldiers of Tunare got better. 
	quest::faction(63,-10); #Crushbone Orcs got worse.
}
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
	return 1;
	}
}


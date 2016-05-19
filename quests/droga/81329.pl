#######################################
## NPC: an Iksar slave NPCID-81329
## Zone: Temple of Droga
## Quest: Shackle of Steel #6
## Questgiver : an Iksar Master (Master Rinmark) in Timorous Deep    
## by Patrikpatrik
## May 18th 2016
#######################################

## NOTES: According to p1999, he is supposed to con amiable or better, 
## which suggests that he is on the same faction
## as Master Rinmark and will decrease faction if killed. 
## -Faction: Swift Tails- 
## -Faction Hits: Legion of Cabilis -30, Swift Tails -30


sub EVENT_SAY {
my $veltar = quest::saylink("Are you Veltar?", 1);
my $sent = quest::saylink("sent", 1);
my $coppernickel = quest::saylink("coppernickel key", 1);

	if ($text=~/Hail/i){
		quest::emote(" seems to have lost all hope. He sadly looks to the ground. His shackles are different than the others
		you see in this cell. One is definitely steel and not of goblin design. The other is made of an unfamiliar metal.");
		}
	if ($text=~/Veltar/i){
		quest::emote("'s soiled face shines with a glint of hope. 'You know my name? Who has $sent you to find me?'");
		}
	if ($text=~/sent/i){
		quest::say("Then word has gotten to him!! If you be a monk of the third rung I will accept your aid.
		You must find the $coppernickel. It is required to release me from this goblin shackle. I have no reward to offer
		other than the shackle of steel. Give me both your shackles of the third rung along with the key and I shall reward
		you the first shackle of the fourth rung.");
		}
	if ($text=~/coppernickel key/i){
		quest::say("The key is split into three parts. Part one is the base and must be combined with the two remainder
		pieces. One piece is in here and the other was lost. I overheard the goblins chattering and recognized the goblin
		phrase, 'lair of flying mouths!!' As for the base, I do not know.");
		}
}# END sub EVENT_SAY

sub EVENT_ITEM {

	if((plugin::check_handin(\%itemcount, 4194 => 1)) && (plugin::check_handin(\%itemcount, 4195 => 1)) && (plugin::check_handin(\%itemcount, 12839 => 1))){ # Shackles of bronze + copper + combined key
	quest::emote(" hands you a shackle and removes the coppernickel shackle so he may flee. He places your shackles on
	his wrists and darts into the darkness.");
	quest::summonitem(4196);
	quest::faction(317,20); #Swift Tails
    quest::faction(193,10); #Legions of Cabilis
	quest::ding();
	quest::exp(30000);
	quest::depop(81329);
	}
	else{
	plugin::return_items(\%itemcount);
	quest::say("I have no use for this!");
	}

}# END sub EVENT_ITEM
	
# End of File, Zone:droga  NPC:81329 -- #an_Iksar_slave
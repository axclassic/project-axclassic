#######################################
## NPC: Scout Charisa
## Zone: Western Wastes
## Quest: Leuz's Task in Skyshrine
## Questgiver : Commander Leuz
## fix for script started by Caved      
## by Patrikpatrik
## Oct 9th 2015
#######################################

#FACTIONS table:
# 9 is apprehensive
# 5 is indifferent
# 4 is amiable
# 3 is Kindly
# 2 is Warmly
#quest::faction(42, 50); #Claws of Veeshan
#quest::faction(362, 50); #Yelinak

sub EVENT_SAY {
	if($faction <=2) {
		quest::say("Hello there $name.");
	}
	else{
		quest::say("You must prove your dedication to Lord Yelinak, begone!");
		}
}

sub EVENT_TIMER{ # needed to despawn after x amount of time.
	if($timer eq "scoutcharisa"){
		quest::depop(120000);
	}
	if($timer eq "stormgiants"){
		quest::depop(120121);
		quest::depop(120121);
		quest::depop(120121);
		quest::depop(120115);
		quest::depop(120121);
		quest::depop(120121);
		quest::depop(120121);
		quest::depop(120121);
	}
} # End sub EVENT_TIMER

# Items of Benevolence, starts in Skyshrine with Commander Leuz
 sub EVENT_ITEM { 
	if($faction<=2){ # At least or equal to Warmly faction
		if (plugin::check_handin(\%itemcount,29683=>1)) {
		
			quest::settimer("scoutcharisa", 1200); #sets her to despawn after 20 minutes
			quest::say("Great! I was wondering when they would send someone out to give me 
			these. In my haste and excitement of this new assignment I forgot these. This 
			scout business is great I must say. It sure beats setting in Southern Ro 
			studying the ruins. I've been following these Storm Giants for days. They've 
			been wandering up and down the coast looking for something."); 
			quest::faction(42,30); # Claws of Veeshan 
			quest::faction(362,30); # Yelinak 
			quest::faction(189,-20); # Kromzek 
			quest::ding(); 
			quest::exp(100000); 
			
			# The snippet below doesnt work, probably needs EVENT_SPAWN conditions to work
			#quest::depop(120000); #depops scout charisa
			#quest::spawn2(120000, 0, 0, -3892, -4698.44, 32.88, -45); #respawns her with a bag in hand.
			#quest::addloot(28013, 1); # puts a bag in her hand
			
			#Spawning for the giants
			quest::settimer("stormgiants", 900); # Sets timer for 15 minutes (in seconds) before despawning
			quest::spawn2(120121,0,0,-3507,-4896,-106, -45);
			quest::spawn2(120121,0,0,-3500,-4885,-116.99, -45);
			quest::spawn2(120121,0,0,-3493.72,-4874.46,-118.61, -45);
			quest::spawn2(120115,0,0,-3480.85,-4866.46,-121.44, -45); # a Kromzek Captain (drops disk)
			quest::spawn2(120121,0,0,-3469.58,-4856.03,-123.43, -35);
			quest::spawn2(120121,0,0,-3456.12,-4843.54,-127.07, -35);
			quest::spawn2(120121,0,0,-3446.08,-4833.12,-129.38, -35);
			quest::spawn2(120121,0,0,-3433.41,-4823.95,-132.20, -35);
			}
			
		# she takes the Broken Disk from Kromzek Captain 
		if (plugin::check_handin(\%itemcount,29684=>1)) { 
			quest::faction(42,30); # Claws of Veeshan 
			quest::faction(362,30); # Yelinak 
			quest::faction(189,-20); # Kromzek 
			quest::summonitem(29688); # Scout Report 
			quest::summonitem(29685); # Robe of Benevolence 
			quest::ding(); quest::exp(100000); 
		} 
		# you give the robe to get the bracer 
		if (plugin::check_handin(\%itemcount,29685=>1)) { 
			quest::summonitem(29686); # Bracer of Benevolence 
		} 
		# you give the bracer to get the talisman 
		if (plugin::check_handin(\%itemcount,29686=>1)) { 
			quest::summonitem(29687); # Talisman of Benevolence 
		}
		# you give the talisman to get the robe 
		if (plugin::check_handin(\%itemcount,29687=>1)) { 
		   quest::summonitem(29685); # 29685  Robe of Benevolence 
		} 
	}
	else{
	plugin::return_items(\%itemcount);
	quest::say("I have no use for this!");
	}
} 

# End of File, Zone:westwastes  NPC:120000 -- #Scout_Charisa 

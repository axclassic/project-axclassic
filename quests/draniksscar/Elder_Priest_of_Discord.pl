############################################
# ZONE: Dranik's Scar
# DATABASE: PEQ-Omens of War
# LAST EDIT DATE: April 25, 2009
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Elder_Priest_of_Discord
# ID: Dranik's Scar
# TYPE: NPC
# RACE: Human
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Pure Discordant Blood ID-77767
# Dark Enchanted Scroll ID-77768
# Spell: Slaughter Gate ID-77754
# Spell: Translocate: Slaughter ID-77755
# Spell: Slaughter Portal ID-77756
# Spell: Circle of Slaughter ID-77757
# Spell: Ring of Slaughter ID-77758
#
# *** QUESTS INVOLVED IN ***
#
# Wall of Slaughter Port Spells
#
# *** QUESTS AVAILABLE TO ***
#
# Wizards and Druids
#
############################################

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Should you wish to return from whence you came, tell me you wish to [go home] and I will send you.  I am also able to aid wizards and druids with the ability to [find their way] further into Discord.");
	}

	if($text=~/find/i) {
		quest::say("If you bring me the right materials -- three samples of pure discordant blood from a dark creature and a rare enchanted scroll, I can help to create teleportation spells.");
	}

	if($text=~/home/i) {
		if(defined $qglobals{OOW_PoD_Origin}) {
			quest::say("Very well.  You are now to return from whence you came.");
			if($qglobals{OOW_PoD_Origin} == 202) { # Plane of Knowledge
                $npc->SendBeginCast(6219, 0);
                quest::castspell(6219, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 52) { # Grobb
                $npc->SendBeginCast(6223, 0);
                quest::castspell(6223, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 24) { # Erudin
                $npc->SendBeginCast(6211, 0);
                quest::castspell(6211, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 41) { # Neriak
                $npc->SendBeginCast(6217, 0);
                quest::castspell(6217, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 10) { # East Freeport
                $npc->SendBeginCast(6213, 0);
                quest::castspell(6213, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 61) { # Felwithe
                $npc->SendBeginCast(6212, 0);
                quest::castspell(6212, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 54) { # Kelethin(Greater Faydark)
                $npc->SendBeginCast(6214, 0);
                quest::castspell(6214, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 29) { # Halas
                $npc->SendBeginCast(6215, 0);
                quest::castspell(6215, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 49) { # Oggok
                $npc->SendBeginCast(6218, 0);
                quest::castspell(6218, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 2) { # Qeynos
                $npc->SendBeginCast(6220, 0);
                quest::castspell(6220, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 19) { # Rivervale
                $npc->SendBeginCast(6221, 0);
                quest::castspell(6221, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 55) { # Ak`Anon
                $npc->SendBeginCast(6210, 0);
                quest::castspell(6210, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 60) { # Kaladim
                $npc->SendBeginCast(6216, 0);
                quest::castspell(6216, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 155) { # Shar Vahl
                $npc->SendBeginCast(6222, 0);
                quest::castspell(6222, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 50) { # Gukta(Rathe Mountains)
                $npc->SendBeginCast(6219, 0);
                quest::castspell(6219, $userid);
			}
            else { # Unknown
                $npc->SendBeginCast(6219, 0);
                quest::castspell(6219, $userid);
            }
            quest::delglobal("OOW_PoD_Origin");
		}
        else {
			quest::say("I do not know from whence you came."); # Text made up
            $npc->SendBeginCast(6219, 0);
            quest::castspell(6219, $userid);
		}
	}
}

sub EVENT_ITEM {
# Pure Discordant Blood and Dark Enchanted Scroll
	if(plugin::check_handin(\%itemcount, 77767 => 3, 77768 => 1)) {
		quest::emote("takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.");
		quest::say("You may now travel further into Discord, true power awaits!");
		if($class eq "Wizard") {
			quest::summonitem(77654); # Item: Spell: Slaughter Gate
			quest::summonitem(77655); # Item: Spell: Translocate: Slaughter
			quest::summonitem(77656); # Item: Spell: Slaughter Portal
		}
		if($class eq "Druid") {
			quest::summonitem(77657); # Item: Spell: Circle of Slaughter
			quest::summonitem(77658); # Item: Spell: Ring of Slaughter
		}
		quest::ding();
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:Dranik's Scar  ID:302043 -- Elder_Priest_of_Discord


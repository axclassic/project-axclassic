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
                $npc->CastSpell(6219, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 52) { # Grobb
                $npc->CastSpell(6223, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 24) { # Erudin
                $npc->CastSpell(6211, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 41) { # Neriak
                $npc->CastSpell(6217, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 10) { # East Freeport
                $npc->CastSpell(6213, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 61) { # Felwithe
                $npc->CastSpell(6212, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 54) { # Kelethin(Greater Faydark)
                $npc->CastSpell(6214, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 29) { # Halas
                $npc->CastSpell(6215, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 49) { # Oggok
                $npc->CastSpell(6218, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 2) { # Qeynos
                $npc->CastSpell(6220, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 19) { # Rivervale
                $npc->CastSpell(6221, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 55) { # Ak`Anon
                $npc->CastSpell(6210, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 60) { # Kaladim
                $npc->CastSpell(6216, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 155) { # Shar Vahl
                $npc->CastSpell(6222, $userid);
			}
			elsif($qglobals{OOW_PoD_Origin} == 50) { # Gukta(Rathe Mountains)
                $npc->CastSpell(6219, $userid);
			}
            else { # Unknown
                $npc->CastSpell(6219, $userid);
            }
            quest::delglobal("OOW_PoD_Origin");
		}
        else {
			quest::say("I do not know from whence you came."); # Text made up
            $npc->CastSpell(6219, $userid);
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


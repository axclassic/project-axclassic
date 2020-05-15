#Zone: dranikssar
#NPC Name: Priest_of_Discord
#NPC ID: 302046 draniksscar only

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("Should you wish to return from whence you came, tell me you wish to [go home] and I will send you.");
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


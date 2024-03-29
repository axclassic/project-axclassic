#items: 76013, 76014, 76015, 76016, 76017, 76018, 76019, 76048, 76065, 76274, 76275 
sub EVENT_SAY {
    if($text=~/hail/i) {
        quest::emote("continues to chant towards the altar as you approach. 'If you are in need of our aid speak to the disciple and bring me one of the soulstones that he sells. I will summon your corpse, but if you want to include resurrection, it's free for under level 50, 100pp for under level 60 and 200pp after that. I must continue to delve into the twilight of our world in search of lost souls.'");
    }
}

sub DoSummon {
    quest::emote("takes your stone and places it on the altar. Shadows begin to drift across the floor and over the altar and finally onto the soulstone.  The priest's voice chants with intensity and is soon joined with several others as the shadows slowly coalesce into a wispy mass that feels familiar.  The two candles near the altar explode with light and there, before you, appears all that remains of your former life.");
    my $CorpseCount = $client->GetCorpseCount();
    if($CorpseCount > 0) {
        quest::summonallplayercorpses($charid);
        quest::delglobal($name.".potimeb_corpse");
    }
    else {
        quest::say("I do not sense any remnants of your former self.");
    }
}

sub DoSummonAndRez {
    quest::emote("takes your stone and places it on the altar. Shadows begin to drift across the floor and over the altar and finally onto the soulstone.  The priest's voice chants with intensity and is soon joined with several others as the shadows slowly coalesce into a wispy mass that feels familiar.  The two candles near the altar explode with light and there, before you, appears all that remains of your former life.");
    my $CorpseCount = $client->GetCorpseCount();
    if($CorpseCount > 0) {
        quest::summonandrezallplayercorpses($charid);
        quest::delglobal($name.".potimeb_corpse");
        quest::castspell(5249, $userid);
    }
    else {
        quest::say("I do not sense any remnants of your former self.");
    }
}

sub EVENT_ITEM {
    my $failure = "This focus is not powerful enough to summon the remnants of your former self.  The disciple of Luclin can help you select an appropriate focus.";
    if(plugin::check_handin(\%itemcount, 76013 => 1)) {
        #Minor Soulstone
        if($ulevel < 21) {
            DoSummonAndRez();
        }
        else {
            quest::say($failure);
            quest::summonitem(76013); # Item: Minor Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76014 => 1)) {#Lesser Soulstone
        if($ulevel < 31) {
            DoSummonAndRez();
        }
        else {
            quest::say($failure);
            quest::summonitem(76014); # Item: Lesser Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76015 => 1)) {#Soulstone
        if($ulevel < 41) {
            DoSummonAndRez(); 
        }
        else {
            quest::say($failure);
            quest::summonitem(76015); # Item: Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76016 => 1)) {#Greater Soulstone
        if($ulevel < 51) {
            DoSummonAndRez(); 
        }
        else {
            quest::say($failure);
            quest::summonitem(76016); # Item: Greater Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76017 => 1)) {#Faceted Soulstone
        if($ulevel < 56) {
            if($platinum >= 100) {
                DoSummonAndRez();
            }
            else {
                DoSummon();
            }
        }
        else {
            quest::say($failure);
            quest::summonitem(76017); # Item: Faceted Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76018 => 1)) {#Pristine Soulstone
        if($ulevel < 71) {
            if($ulevel < 61) {
                if($platinum >= 100) {
                    DoSummonAndRez();
                }
                else {
                    DoSummon();
                }
            }
            else {
                if($platinum >= 200) {
                    DoSummonAndRez();
                }
                else {
                    DoSummon();
                }
            }
        }
        else {
            quest::say($failure);
            quest::summonitem(76018); # Item: Pristine Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76019 => 1)) {#Glowing Soulstone
        if($ulevel < 76) {
            if($platinum >= 200) {
                DoSummonAndRez();
            }
            else {
                DoSummon();
            }
        }
        else {
            quest::say($failure);
            quest::summonitem(76019); # Item: Glowing Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76048 => 1)) {#Prismatic Soulstone
        if($ulevel < 81) {
            if($platinum >= 200) {
                DoSummonAndRez();
            }
            else {
                DoSummon();
            }
        }
        else {
            quest::say($failure);
            quest::summonitem(76048); # Item: Prismatic Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76065 => 1)) {#Iridescent Soulstone
        if($ulevel < 86) {
            if($platinum >= 200) {
                DoSummonAndRez();
            }
            else {
                DoSummon();
            }
        }
        else {
            quest::say($failure);
            quest::summonitem(76065); # Item: Iridescent Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76274 => 1)) {#Phantasmal Soulstone
        if($ulevel < 91) {
            if($platinum >= 200) {
                DoSummonAndRez();
            }
            else {
                DoSummon();
            }
        }
        else {
            quest::say($failure);
            quest::summonitem(76274); # Item: Phantasmal Soulstone
        }
    }
    elsif(plugin::check_handin(\%itemcount, 76275 => 1)) {#Luminous Soulstone
        if($ulevel < 96) {
            if($platinum >= 200) {
                DoSummonAndRez();
            }
            else {
                DoSummon();
            }
        }
        else {
            quest::say($failure);
            quest::summonitem(76275); # Item: Luminous Soulstone
        }
    }
    plugin::return_items(\%itemcount);
}


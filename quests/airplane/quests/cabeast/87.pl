sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("These are the sacred unholy grounds of the Crusaders of Greenmist and the Scaled Mystics.  If you do not belong to us. you must leave this temple at once or learn great suffering in the name of Cazic-Thule."); }
}
sub EVENT_ITEM { 
if($item1=="18205"){quest::say("Welcome into our brotherhood.  Know you that our way is the way of pain.  Do as we say and you shall climb the rungs of knighthood.  Listen well to the Lords of Pain within this temple and follow the words of the hierophants. for Cazic-Thule speaks to us through them.  Take this khukri.  It is the chosen weapon of the Crusaders and can deliver great pain unto our foes.  Go now and learn our ways.  Seek out Lord Gikzic.");
quest::summonitem("5120");
quest::ding(); quest::exp("100"); }
}
#END of FILE Zone:cabeast  ID:87 -- Arch_Duke_Xog 


######################
## Edited responses ##
##    By Aardil     ##
##   11-24-2013     ##
######################

sub EVENT_SAY {
    if ($text=~/Hail/i) {
        quest::say("Hail!  Welcome to the Hall of Truth.  We. the Knights of Truth. are all the hope this city has of loosening the grip of Lucan D'lere and his militia.  I seek a young knight to serve the will of the Truthbringer.");
    }
    if ($text=~/what truthbringer/i) {
        quest::say("Shame on you.  To set foot into the Hall of Truth and not know for whom it was built.  Still. it is never too late to see the light.  Mithaniel Marr is our deity.  He is the Truthbringer.  By living our lives in valor and crushing all those who suppress His beliefs, we serve Him.");
    }
    if ($text=~/serve/i) {
        quest::say("Stand tall then, knight! We have need of your services. We have sent a man to infiltrate the militia. We fear he may soon be found out. Take him this note of warning. Say the words, 'Truth is good,' and you shall find him. Be careful, young knight. The militia does not take prisoners.");
        quest::summonitem(18817); #Note to give to guard
    }
    if ($text=~/condemned/i) {
        quest::say("Why would Lucan visit a condemned building? He must be searching for something. When I last visited the local forge, I heard rumors of Lucan searching for a sword named Soulfire. If this is true, you must find it first! No more power should go his way. Seek this sword out!");
    }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 18818 => 1)) {
        quest::say("Zimel\'s Blades?! Hmmmmm. It doesn't ring a bell and the remainder of the writing is too hard to make out. It kind of looks like a list of prices. You know, down at the Office of the People they might be able to tell us if this place exists. Go speak with Rashinda. She knows all about Freeport. If Zimel's Blades existed, you must report back to me what happened to it.");
        #Freeport Militia Faction
        quest::faction("105","-1");
        #Steel Warriors Faction
        quest::faction("311","1");
        #Knights of Truth Faction
        quest::faction("184","1");
        quest::summonitem(18818);  #returns the Note forlater
        quest::say ("Head to the Office of the People, not far from the Hall of Truth, and find Rashinda Elore upstairs.");
    }
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8074 -- Kalatrina_Plossen

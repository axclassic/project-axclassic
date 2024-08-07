##############################
##     Edited by Aardil     ##
## for missing summon item  ##
##      and dialogue        ##
##       11-25-2013         ##
##############################
sub EVENT_SAY { 
    if($text=~/Hail/i) {
        quest::say("Hail. good citizen!  You have entered the Hall of Truth.  What is it you seek?  Many citizens come to request aid in dealing with the local rogues or the oppression of our sworn enemies. the Freeport Militia.  A few valiant ones have been summoned to the Hall of Truth.");
    }
    if($text=~/token/i) {
        quest::say("This is good news indeed! You need to bring to me a spider venom sac to continue on your path.");
    }
    if($text=~/summoned/i) {
        quest::say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
    }
    quest::summonitem(18896);
}

sub EVENT_ITEM { 
    if(plugin::check_handin(\%itemcount, 14018 => 1)) {
        quest::summonitem("12144");
        quest::faction("184","10");
        quest::faction("86","-1");
        quest::faction("105","-1");
        quest::faction("258","2");
        quest::faction("311","1");
    }
    elsif(plugin::check_handin(\%itemcount, 12144 => 1, 13865 => 1)){
        quest::faction("184","10");
        quest::faction("86","-1");
        quest::faction("105","-1");
        quest::faction("258","2");
        quest::faction("311","1");
    }
    elsif(plugin::check_handin(\%itemcount, 13866 => 1)) {
        quest::summonitem("18828");
        quest::givecash("0","0","6","0");
        quest::faction("184","10");
        quest::faction("86","-1");
        quest::faction("105","-1");
        quest::faction("258","2");
        quest::faction("311","1");
    }
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount,);
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8036 -- Merko_Quetalis 


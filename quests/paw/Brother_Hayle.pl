##############################
##     Edited by aardil     ##
## Removed Faction for bots ##
##       11-26-2013         ##
##############################
sub EVENT_SAY
{
    if($text=~"Hail") {
        quest::say("This is no place for you. These Splitpaws are very fierce. Only the power of Rodcet Nife will guide them to the light. By the way, I might warn you that the cells here lock behind you.");
    }
    if($text=~"What proof of nobility") {
        quest::say("I require the returned note I gave you, a Testimony of Truth, a Sword of Faith and finally the hilt of Soulfire. The Testimony and Sword of Faith are earned in the Hall of Truth, but for the hilt of Soulfire you shall have to battle [Xicotl].");
    }
    if($text=~"Who is Xicotl") {
        quest::say("Xicotl is the evil troll who attempted to steal Soulfire from the vaults of the Temple of Life. The hilt of Soulfire broke off during the battle and now rests in the hands of this troll shadowknight. From what I have heard, he is frequently an invited guest at the castle called Mistmoore. Woe to any paladin who dares set foot upon the land of Mistmoore, but should you attempt it you might search the guest rooms for the troll. May Rodcet Nife walk with you.");
    }
}

sub EVENT_ITEM
{
    #Check for A Sealed Note ID:18936
    if(plugin::check_handin(\%itemcount, 18936 => 1)) {
        quest::say("Finally!! I see that Ariska has found a noble knight to retrieve Soulfire. Per Ariska's orders I am not to give Soulfire to you until you can show me [proof of nobility]. You must honor both the Temple of Life as well as the Hall of Truth and to a high degree. Only then shall you hold Soulfire.");

        #Give Priest of Life Faction
        quest::faction(257, 5);
        #Give Knights of Thunder Faction
        quest::faction(183, 5);
        #Give Guards of Qeynos Faction
        quest::faction(135, 5);
        #Lower BloodSabers Faction
        quest::faction(21, -5);
        #Give Antonious Bayle Faction
        quest::faction(9, 5);

        quest::ding(); quest::exp(200);

        #Give a note ID:18937
        quest::summonitem(18937);
    }
    elsif(plugin::check_handin(\%itemcount, 18937 => 1, 13947 => 1, 18828 => 1, 12197 => 1 )) {
        quest::say("You have proven yourself worthy to hold Soulfire. Do not let her slip into the hands of evil. There are many who wish to free the many trapped souls of shadowknights and necromancers trapped inside the blade. The power of the blade can be called upon to heal you if need be. May Rodcet Nife and the twins of Marr hold you in their glory.");

        quest::summonitem(5504);
    }
    else {
        quest::say("Sorry, I can't use this.");
        plugin::return_items(\%itemcount);
        if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
        }
    }
}
#END of File Zone:paw ID:18071 -- Brother_Hayle

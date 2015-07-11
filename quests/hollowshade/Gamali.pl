
sub EVENT_SAY { 
    if($text=~/Hail/i){
    quest::say("Are you here for water? Hand me a bottle and I will fill it for you.");
    }
}
sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount,16598 => 1)){
    quest::say("You must be working on Vah Shir brewing, Good luck to you $name.");
    quest::summonitem(31761);
    }
}    
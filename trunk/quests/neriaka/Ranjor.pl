sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Me Guildmaster of Da Bashers. No time for small talk."); 
}
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18790 => 1)){
    quest::say("Arhh.. Why you here? GO HOME!");
    quest::summonitem(18790);
	quest::movepc(52,-187.7,307.9,24.2);
}
else {
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    quest:say("Me can not eat this... Take back!");
    plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:grobb  ID:40024 -- Ranjor 


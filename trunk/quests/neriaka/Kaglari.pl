sub EVENT_SAY { 
if($text=~/Hail/i) {
quest::say("SNORT!  HHUUUUCCCKSSH..  Peh!  You speak at Kaglari. High Priestess of Dark Ones. BE GONE!  SNORT!"); 
}
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18791 => 1)) {
    quest::say("Why you here? GO HOME $name!");
    quest::summonitem(18791);
    quest::movepc(52,489.4,27.3,52.2);
 }
else {
    plugin::try_tome_handins(\%itemcount, $class, 'Shaman');
    quest:say("Me can not eat this... Take back!");
    plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:grobb  ID:40026 -- Kaglari 


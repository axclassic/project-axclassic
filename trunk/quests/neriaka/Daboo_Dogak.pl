sub EVENT_SAY {
if($text =~ /Hail/i) {
	quest::say("Me guild master of Da Bloodwolves.");
	quest::say("No time for talk!");
 }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18792 => 1)){
    quest::say("Why you here $name? GO HOME!");
	quest::summonitem(18792);
	quest::movepc(52,124.5,238.3,-7.8);	
    }
else {
plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
quest:say("Me can not eat this... Take back!");
plugin::return_items(\%itemcount);
 }
}
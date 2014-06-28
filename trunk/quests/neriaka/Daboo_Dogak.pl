sub EVENT_SAY {
if($text =~ /Hail/i) {
	quest::say("Me guild master of Da Bloodwolves.");
	quest::say("No time for talk!");
 }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119870 => 1)){
    quest::say("Why you here $name? GO HOME!");
	quest::summonitem(119870);
	quest::movepc(52,119.0,239.0,-5.3);	
    }
else {
plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
quest:say("Me can not eat this... Take back!");
plugin::return_items(\%itemcount);
 }
}
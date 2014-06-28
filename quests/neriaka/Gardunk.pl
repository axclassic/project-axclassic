sub EVENT_SAY { 
if($text =~ /Hail/i) {
	quest::say("Me beastlord guild master of Da Dark Ones.");
	quest::say("No time for talk, Go away");
 }
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18845 => 1)){
    quest::say("Haaah!! Why you here? GO HOME $name!");
	quest::summonitem(18845);
    quest::movepc(52,-424.0,-9.4,72.2);
    }
}
#END of FILE Zone:grobb  ID:6084 -- Gardunk 


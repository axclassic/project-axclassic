sub EVENT_SAY { 
if($text =~ /Hail/i) {
	quest::say("Me beastlord guild master of Da Dark Ones.");
	quest::say("No time for talk, if you have someting fer me, give it!.");
 }
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18845 => 1)){
    quest::say("Haaah!! Bow to Gardunk!! Gardunk make you feared.. make you powered! Dark power flow through you! Hate and Fear in your blood! Gardunk learn you da way of beast!.");
    quest::say("You want to be like Gardunk? Ok, take dis and wear it. come back here when you kill some stuff $name.");
	quest::summonitem(13576);
    quest::ding();
    quest::faction(70,10); #Dark Ones
	quest::faction(292,10); #Shadowknights of Night Deep
	quest::faction(106,-30); #Frogloks of Guk
	quest::exp(1000);
	quest::rebind(52,68.4,76.1,2.2)
  	}
	else{
	 #do all other handins first with plugin, then let it do disciplines
plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
quest:say("Me can not eat this... Take back!");
plugin::return_items(\%itemcount);
 }
}

#END of FILE Zone:grobb  ID:6084 -- Gardunk 


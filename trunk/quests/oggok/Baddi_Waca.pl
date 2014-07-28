sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say('"Mmmph!!  Who you?  Oh. you $name.  You supposed to be promising Craknek.  I am Baddi Waca Guildmaster of berserker.  There bad things in swamp.  You want help Crakneks or you want Guntrik bash your face!!?');
 }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119869 => 1)){ #Tattered Note
    quest::say("Arhh.. Baddi mighty berserker.. Baddi teach you to control rage.. you fight for Baddi now.");
    quest::summonitem(13505);
	quest::ding();
	quest::exp(1000);
	quest::rebind(49,-255,292,5);
}
else {
  plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
  quest::say("me no need this.. Take back!");
  plugin::return_items(\%itemcount);
}
}
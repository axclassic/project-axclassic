
sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say('Hello. I am the guild master.');
 }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  if (plugin::check_handin(\%itemcount, 18847 => 1)) {
  quest::say("I was hoping ye would see the wisdom of joining our fine guild. Now before ye take off on some fool quest and get yerself killed, take this tunic -- it's not much, but it will keep yer bones from freezing and give you a wee bit o' protection. There's much to be done in and around our fine city. I suggest that ye talk to Haladorf over there. Ye best get to work! Come back and see me as you gain experience and I'll train ye in our way. Oh, and one more thing. You might be wonderin' what that Tome of Corroded Axe be for. Hand it to me and I will grant you your first skill with throwin' axes!");
    quest::summonitem(36009);
	quest::ding();
	quest::faction(361, 10); #Wolves of the North
	quest::faction(213, -10); #Merchants of Halas
	quest::faction(294, -10); #Shamen of Justice
	quest::faction(311, 10); #Steel Warriors
	quest::faction(275, -30); #Rogues of the White Rose
	quest::exp(1000);
  plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
  plugin::return_items(\%itemcount);
}
}
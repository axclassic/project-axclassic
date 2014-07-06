sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Hello. I am the Berserker guild master. With my help, you will learn to control your rage and become a higly skilled fighter");
 }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 36003 => 1)) {
  quest::say("I was hoping ye would see the wisdom of joining our fine guild. Now before ye take off on some fool quest and get yerself killed, take this tunic -- it's not much, but it will keep yer bones from freezing and give you a wee bit o' protection. There's much to be done in and around our fine city. I suggest that ye talk to Haladorf over there. Ye best get to work! Come back and see me as you gain experience and I'll train ye in our way.");
    quest::summonitem(36009);
	quest::ding();
	quest::faction(361, 10); #Wolves of the North
	quest::faction(213, -10); #Merchants of Halas
	quest::faction(294, -10); #Shamen of Justice
	quest::faction(311, 10); #Steel Warriors
	quest::faction(275, -30); #Rogues of the White Rose
	quest::exp(1000);
	quest::say(" Oh, and one more thing. If visit Boster MacHadden, he has a Tome of Corroded Axe you can purchase. Hand it to me and I will grant you your first skill with throwin' axes!");
	}
	elsif (plugin::check_handin(\%itemcount, 59892 => 1)) {
	quest::addskill(51,1);
	quest::ding();
	quest::say("welldone $name! You must now practice your throwing to increase the skill.");
	quest::exp(500);
	}
     else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}

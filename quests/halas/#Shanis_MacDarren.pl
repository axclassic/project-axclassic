sub EVENT_SAY {
my $tome = quest::saylink("tome", 1);
 if($text =~ /Hail/i) {
	quest::say("Hello. I am the Berserker guild master. With my help, you will learn to control your rage and become a higly skilled fighter.");
	quest::say("If you are ready to join our guild, Read the note in your inventory and then hand it to me.  Make sure to ask me about that $tome in your inventory as well. It will help you greatly during your adventures.");
 }
if($text =~/tome/i) {
		quest::say("In your inventory you will see a book called 'Tome of Corroded Axe'. This tome will allow you to summon throwing axes to be used in combat. Hand me the book and I will teach you a new disiplne.");
	}
	 if($text =~/free/i) {
		quest::say(" Talk to Boster MacHadden to recieve your sample of components.");
	}
}

sub EVENT_ITEM {
my $free = quest::saylink("free", 1);
my $S = quest::saylink("S", 1);
   if (plugin::check_handin(\%itemcount, 36003 => 1)) {
  quest::say("I was hoping ye would see the wisdom of joining our fine guild.");
  quest::say("Now before ye take off on some fool quest and get yerself killed, take this tunic -- it's not much, but it will keep yer bones from freezing and give you a wee bit o' protection.");
  quest::say("There's much to be done in and around our fine city. I suggest that ye talk to Haladorf over there. Ye best get to work! Come back and see me as you gain experience and I'll train ye in our way.");
    quest::summonitem(36009);
	quest::ding();
	quest::faction(361, 10); #Wolves of the North
	quest::faction(213, -10); #Merchants of Halas
	quest::faction(294, -10); #Shamen of Justice
	quest::faction(311, 10); #Steel Warriors
	quest::faction(275, -30); #Rogues of the White Rose
	quest::exp(1000);
	}
	elsif (plugin::check_handin(\%itemcount, 59892 => 1)) {
	quest::addskill(51,1);
	quest::ding();
	quest::say(" Call up your Combat Abilities window.");
	quest::say("Click on the $S located near the top right corner of the Combat Abilities window.  This will open the Combat Skills window.");
	quest::say("Your new skill, 'Corroded Axe' should now be displayed in the window.  Click on the name of the skill once, and then look at the bottom of the window.  Your should see a 'Make Hotkey' button.  Clicking on this will allow you to make a hotkey for your new skill.");
	quest::say("Place the new hotkey in one of the empty hotkey slots of the Combat Abilities Window.");
	quest::say("well done $name! You must now practice your throwing to increase the skill.");
	quest::exp(500);
	quest::say("Remember to stock up on components if you wish to use your new skill and create some throwing axes.  You can visit the Berserker Tome Merchants in your home town to get one $free sample of components or to buy more tomes and components.");
	}
 else { 
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
    plugin::return_items(\%itemcount);
    quest::say("I have no need of this, take it back.");
 }
 }
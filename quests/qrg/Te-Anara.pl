######################################
## NPC: Te-Anara                    ##
## Zone: Surefall Glade (qrg        ##
##  Druid Guildmaster note turnin   ##
## Revised by caved for AXClassic   ##
## EQWorld Server     15-12-2010    ##
######################################
sub EVENT_SAY {
my $Tunare = quest::saylink("Tunare", 1);
my $Karana = quest::saylink("Karana", 1);
my $Greater_Faydark = quest::saylink("Greater_Faydark", 1);
my $Surefall_Glade = quest::saylink("Surefall_Glade", 1);
my $laws = quest::saylink("laws", 1);
my $bear = quest::saylink("bear", 1);
my $wrong = quest::saylink("wrong", 1);
my $special = quest::saylink("special", 1);
 
  if (($text=~/Druid/i) && ($ulevel == 1) && ($class eq "Druid")) {
    quest::say("A Fine choice, the Way of the Druid, but I have a few more questions for you. Which Deity did you choose? $Karana or $Tunare?");
  }
  if (($text=~/Tunare/i) && ($ulevel == 1) && ($class eq "Druid")) {
    quest::say("Following the way of Tunare? A Good Choice, Followers of the Mother of all believe we are all Tunare's children and seek to help Norrath.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $Greater_Faydark, or $Surefall_Glade.");
  }
  if (($text=~/Karana/i) && ($ulevel == 1) && ($class eq "Druid")) {
    quest::say("Following the way of The Karana? A Good Choice, Followers of The Rainkeeper believe in the absolute power of storms.");
    quest::say("On your way then, I will send you to Surefall Glade. Hand this note to Te'Anara, She is your Guildmaster of the Druids."); 
	quest::say("Be sure you find Soulbinder Saela and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(119845);
	quest::movepc(3,-402,-203,4);
  }
  if (($text=~/Greater_Faydark/i) && ($ulevel == 1) && ($class eq "Druid")) {
    quest::say("On your way then, I will send you to Kelethin. Hand this note to Heartwood Master. He is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Oakstout in Kelethin and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(18786);
	quest::movepc(54,227,-628,76);
	}
  if (($text=~/Surefall_Glade/i) && ($ulevel == 1) && ($class eq "Druid")) {
    quest::say("On your way then, I will send you to Surefall Glade. Hand this note to Te'Anara, She is your Guildmaster of the Druids."); 
	quest::say("Be sure you find Soulbinder Saela and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(119845);
	quest::movepc(3,-402,-203,4);
	}
  if ($text=~/Hail/i){
    $client->Message(14,"Welcome, friend. I hope your stay in Surefall Glade will enlighten your soul. While you are here we ask you to abide by the $laws of the Jaggedpine.");
  }
  elsif ($text=~/laws/i) {
    $client->Message(14,"We ask that you do not start campfires on our land. Do not litter our land with any items. Do not chop down our pines or tread upon any foliage. Please do not take more than a bellyful of fish. Do not harm any other wildlife and stay clear of the great $bear !");
  }
  elsif ($text=~/bear/i) {
    $client->Message(14,"The great bear I speak of is Mammoth. He has lived among us for over a century. Tunare has truly blessed us with his presence. As long as Mammoth lives, so too does Surefall Glade. We are currently worried. Corun has reported that there is something $wrong with Mammoth.");
  }
  elsif ($text=~/wrong/i) {
    $client->Message(14,"Mammoth is not eating. We believe something is lodged in his throat. We require a young druid to fetch a $special potion.");
  }
  elsif ($text=~/special/i) {
    $client->Message(14,"Go to the gnome city of Ak'Anon on the continent of Faydwer. With their great zoo, you will find a gnome named Kimble Nogflop. Give him this flask of nitrates and he shall hand you a special potion which will force Mammoth to cough up whatever may be stuck inside his throat. Be sure to show me what you find inside his throat upon your return.");
    quest::summonitem(13945);
  }
}

sub EVENT_ITEM { 
my $Druid = quest::saylink("Druid", 1);
if (plugin::check_handin(\%itemcount, 18713 => 1) && $class eq "Druid") { 
  quest::say("I am the Te'Anara of the Jagged Pine. A few years ago, The Rathe server was created in order to bring back the feel of the orginal EQ zones. Many things have changed over the years and with those changes, some things could not be done anymore.");
    quest::say("You were sent to me because there is a problem with getting you to the correct city with the correct guild summons.");
	quest::say("Since you are talking to me I must assume you are a $Druid?");
	}
  elsif (plugin::check_handin(\%itemcount, 18809 => 1)) {
    $client->Message(14,"Oh my, this must belong to Antonius Bayle! I shall see that he receives it. You have done a great service to Qeynos and Surefall Glade. I rewards you with this. May it be of good use in your future deeds.");
    quest::summonitem(15222);
    quest::faction(159, 10); #Jagged Pine Treefolk
    quest::faction(265, 10); #Protectors of Pine
    quest::faction(267, 10); #QRG protected Animals
    quest::faction(135, 10); #Guards of Qeynos
    quest::faction(347, -30); #Unkempt Druids
     quest::ding();
	 quest::exp(100);
  }
    elsif (plugin::check_handin(\%itemcount, 119927 => 1)) {
    $client->Message(14,"Thank you $name, I have been waiting for this. I am sure Gharin was drunk again... I don't know why Antonious Bayle keeps using him.");
    quest::summonitem(15222);
    quest::faction(159, 10); #Jagged Pine Treefolk
    quest::faction(265, 10); #Protectors of Pine
	quest::faction(347, 10); #Unkempt Druids
    quest::faction(267, -30); #QRG protected Animals
    quest::faction(135, -30); #Guards of Qeynos
    quest::ding();
	quest::exp(2000);
	quest::givecash(0,2,8,0);
  }
    elsif (plugin::check_handin(\%itemcount, 119926 => 1)) {
    $client->Message(14,"Aye! This is good news. We shall try to supply Qeynos with a limited number of acres to begin their lumberyard. Here, my good messenger. A token to share in the good news.");
    quest::summonitem(15222);
    quest::faction(159, 10); #Jagged Pine Treefolk
    quest::faction(265, 10); #Protectors of Pine
	quest::faction(347, 10); #Unkempt Druids
    quest::faction(267, -30); #QRG protected Animals
    quest::faction(135, -30); #Guards of Qeynos
    quest::ding();
	quest::exp(2000);
	quest::givecash(0,2,8,0);
  }
  elsif (plugin::check_handin(\%itemcount, 119845 => 1)) {
    $client->Message(14,"Well met, friend of the forest. You will find power and enlightenment among these woods. Here, wear this tunic and represent the Jaggedpine with pride. Salmekia Treherth will help train you and teach you the duties of Jaggedpine Treefolk. The forests, being the soul and heart of Norrath, depend on you and your actions from this day forth.");
    quest::summonitem(13510);
    quest::ding();
	quest::faction(159, 10); #Jaggedpine Treefolk
    quest::faction(265, 10); #Protectors of Pine
    quest::faction(267, 10); #QRG protected Animals
    quest::faction(135, 10); #Guards of Qeynos
    quest::faction(347, -30); #Unkempt Druids
	quest::exp(1000);
  }
  else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    return 1;
  }
}


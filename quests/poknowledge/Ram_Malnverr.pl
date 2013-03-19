######################################
## NPC: Ram Malnverr                ##
## Zone: POK                        ##
## Epic 1.5-2.0 NPC                 ##
## Created by caved for AXClassic   ##
## Rathe Server 11-06-2011          ##
## Revised and added 2.5 and 3.0    ##
## On 18-10-2011                    ##
######################################

sub EVENT_SAY {
my $sick = quest::saylink("sick", 1);
my $secret = quest::saylink("secret", 1);
my $craft = quest::saylink("craft", 1);
my $sacrofice = quest::saylink("sacrofice", 1);
if($text=~/Hail/i&&$ulevel == 65){
$client->Message(14,"Hello $name\! Most people you will meet around here will tell you to stay far away from me... I am a very old and $sick man you know?");
}
elsif($text=~/Hail/i&&$ulevel <= 64){
$client->Message(14,"Begone newbee! I have no time for you!! Can't you see I am a sick old man? Come back when you got something decent to offer me, ugh ugh were are my stupid pills?");
}
elsif($text=~/sick/i&&$ulevel == 65){
$client->Message(14,"Yes I am very sick... Doctors say that I have only weeks or days to live but what do they know hahaha I got a few tricks up my sleeve. Do you want to know the $secret of my life?");

}
elsif($text=~/secret/i&&$ulevel == 65){
$client->Message(14, "The secret noone knows is that I used to be the very best weaponsmith Norrath has ever known HA yes they call themself smiths lol I be laughing in their faces. Although i am now old and ill, I can still $craft the very best... (and I am the ONLY one)");

}
elsif($text=~/craft/i&&$ulevel == 65){
$client->Message(14, "I can craft the epic weapons of all classes 1.5, 2.0, 2.5 and the 3.0 versions, but I won't help you unless you can make the ultimate $sacrofice I demand of you..");

}
elsif($text=~/sacrofice/i&&$ulevel == 65){
$client->Message(14, "As i said i am a dieing man but I know of a chanting that could extend my life for a couple of years, when you give me your epic piece, I will place my hand on your forehead and drain your soul in order to extend my life. It won't kill you but will drain all your battle experience.. yes you will be lvl 1. Only then will I grant you the next version of your epic weapon. WARNING: People that wield 2x a 1 hand epic weapon like Rangers and Beastlords, should give me only 1 of the 2 epic weapons. Warriors should also give me 1 of their 1 handers.");
}
else {
$client->Message(14,"I don't talk to you for you are not worthy!! You are a newbie and you have nothing to offer me, begone!!");
return 1;
}
}
######################################################################--BEGIN DRUID--####################################################################################
sub EVENT_ITEM {
if($ulevel == 65 && $class == 'druid' && plugin::check_handin(\%itemcount, 20490 => 1)) { #Druid epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");;
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(62863); #Druid Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Druid Epic!")
}
elsif($ulevel == 65 && $class == 'druid' && plugin::check_handin(\%itemcount, 62863 => 1)) { #Druid epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(62880); #Druid Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Druid Epic!")
}
elsif($ulevel == 65 && $class == 'druid' && plugin::check_handin(\%itemcount, 62880 => 1)) { #Druid epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119466); #Druid Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Druid Epic!")
}
elsif($ulevel == 65 && $class == 'druid' && plugin::check_handin(\%itemcount, 119466 => 1)) { #Druid epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119483); #Druid Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Druid Epic!")
}
######################################################################--BEGIN CLERIC--####################################################################################
elsif($ulevel == 65 && $class == 'cleric' && plugin::check_handin(\%itemcount, 5532 => 1)) { #Cleric epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(5532); #Give back the Sprenkler...
quest::summonitem(9955);#Cleric Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Cleric Epic!")
}
elsif($ulevel == 65 && $class == 'cleric' && plugin::check_handin(\%itemcount, 9955 => 1)) { #Cleric epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(20076); #Cleric Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Cleric Epic!")
}
elsif($ulevel == 65 && $class == 'cleric' && plugin::check_handin(\%itemcount, 20076 => 1)) { #Cleric epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119467); #Cleric Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Cleric Epic!")
}
elsif($ulevel == 65 && $class == 'cleric' && plugin::check_handin(\%itemcount, 119467 => 1)) { #Cleric epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119484); #Cleric Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Cleric Epic!")
}
######################################################################--BEGIN SHADOWKNIGHT--####################################################################################
elsif($ulevel == 65 && $class == 'shadowknight' && plugin::check_handin(\%itemcount, 14383 => 1)) { #Shadowknight epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(50003);#Shadowknight Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Shadowknight Epic!")
}
elsif($ulevel == 65 && $class == 'shadowknight' && plugin::check_handin(\%itemcount, 50003 => 1)) { #Shadowknight epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(48136); #Shadowknight Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Shadowknight Epic!")
}
elsif($ulevel == 65 && $class == 'shadowknight' && plugin::check_handin(\%itemcount, 48136 => 1)) { #Shadowknight epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119469); #Shadowknight Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Shadowknight Epic!")
}
elsif($ulevel == 65 && $class == 'shadowknight' && plugin::check_handin(\%itemcount, 119469 => 1)) { #Shadowknight epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119485); #Shadowknight Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Shadowknight Epic!")
}
######################################################################--BEGIN SHAMAN--####################################################################################
elsif($ulevel == 65 && $class == 'shaman' && plugin::check_handin(\%itemcount, 10651 => 1)) { #Shaman epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(57400);#Shaman Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Shaman Epic!")
}
elsif($ulevel == 65 && $class == 'shaman' && plugin::check_handin(\%itemcount, 57400 => 1)) { #Shaman epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(57405); #Shaman Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Shaman Epic!")
}
elsif($ulevel == 65 && $class == 'shaman' && plugin::check_handin(\%itemcount, 57405 => 1)) { #Shaman epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119470); #Shaman Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Shaman Epic!")
}
elsif($ulevel == 65 && $class == 'shaman' && plugin::check_handin(\%itemcount, 119470 => 1)) { #Shaman epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119486); #Shaman Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Shaman Epic!")
}
######################################################################--BEGIN WIZARD--####################################################################################
elsif($ulevel == 65 && $class == 'wizard' && plugin::check_handin(\%itemcount, 14341 => 1)) { #Wizard epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(12665);#Wizard Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Wizard Epic!")
}
elsif($ulevel == 65 && $class == 'wizard' && plugin::check_handin(\%itemcount, 12665 => 1)) { #Wizard epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(16576); #Wizard Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Wizard Epic!")
}
elsif($ulevel == 65 && $class == 'wizard' && plugin::check_handin(\%itemcount, 16576 => 1)) { #Wizard epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119471); #Wizard Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Wizard Epic!")
}
elsif($ulevel == 65 && $class == 'wizard' && plugin::check_handin(\%itemcount, 119471 => 1)) { #Wizard epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119487); #Wizard Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Wizard Epic!")
}
######################################################################--BEGIN MAGICIAN--####################################################################################
elsif($ulevel == 65 && $class == 'magician' && plugin::check_handin(\%itemcount, 28034 => 1)) { #Magician epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(19092);#Magician Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Magician Epic!")
}
elsif($ulevel == 65 && $class == 'magician' && plugin::check_handin(\%itemcount, 19092 => 1)) { #Magician epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(19839); #Magician Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Magician Epic!")
}
elsif($ulevel == 65 && $class == 'magician' && plugin::check_handin(\%itemcount, 19839 => 1)) { #Magician epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119472); #Magician Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Magician Epic!")
}
elsif($ulevel == 65 && $class == 'magician' && plugin::check_handin(\%itemcount, 119472 => 1)) { #Magician epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119488); #Magician Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Magician Epic!")
}
######################################################################--BEGIN ENCHANTER--####################################################################################
elsif($ulevel == 65 && $class == 'enchanter' && plugin::check_handin(\%itemcount, 10650 => 1)) { #Enchanter epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!.");
quest::summonitem(52952);#Enchanter Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Enchanter Epic!")
}
elsif($ulevel == 65 && $class == 'enchanter' && plugin::check_handin(\%itemcount, 52952 => 1)) { #Enchanter epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(52962); #Enchanter Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Enchanter Epic!")
}
elsif($ulevel == 65 && $class == 'enchanter' && plugin::check_handin(\%itemcount, 52962 => 1)) { #Enchanter epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119473); #Enchanter Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Enchanter Epic!")
}
elsif($ulevel == 65 && $class == 'enchanter' && plugin::check_handin(\%itemcount, 119473 => 1)) { #Enchanter epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119489); #Enchanter Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Enchanter Epic!")
}
######################################################################--BEGIN NECROMANCER--####################################################################################
elsif($ulevel == 65 && $class == 'necromancer' && plugin::check_handin(\%itemcount, 20544 => 1)) { #Necromancer epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(62581);#Necromancer Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Necromancer Epic!")
}
elsif($ulevel == 65 && $class == 'necromancer' && plugin::check_handin(\%itemcount, 62581 => 1)) { #Necromancer epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(64067); #Necromancer Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Necromancer Epic!")
}
elsif($ulevel == 65 && $class == 'necromancer' && plugin::check_handin(\%itemcount, 64067 => 1)) { #Necromancer epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119474);#Necromancer Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Necromancer Epic!")
}
elsif($ulevel == 65 && $class == 'necromancer' && plugin::check_handin(\%itemcount, 119474 => 1)) { #Necromancer epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119490);#Necromancer Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Necromancer Epic!")
}
######################################################################--BEGIN WARRIOR--####################################################################################
elsif($ulevel == 65 && $class == 'warrior' && plugin::check_handin(\%itemcount, 66177 => 1 or 66176 => 1)) { #Warrior epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(60321);#Warrior Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Warrior Epic!")
}
elsif($ulevel == 65 && $class == 'warrior' && plugin::check_handin(\%itemcount, 60321 => 1)) { #Warrior epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(60332); #Warrior Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Warrior Epic!")
}
elsif($ulevel == 65 && $class == 'warrior' && plugin::check_handin(\%itemcount, 60332 => 1)) { #Warrior epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119475);#Warrior Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Warrior Epic!")
}
elsif($ulevel == 65 && $class == 'warrior' && plugin::check_handin(\%itemcount, 119475 => 1)) { #Warrior epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119491);#Warrior Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Warrior Epic!")
}
######################################################################--BEGIN ROQUE--####################################################################################
elsif($ulevel == 65 && $class == 'roque' && plugin::check_handin(\%itemcount, 11057 => 1)) { #Roque epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(52347); #Roque Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Roque Epic!")
}
elsif($ulevel == 65 && $class == 'roque' && plugin::check_handin(\%itemcount, 52347 => 1)) { #Roque epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(52348); #Roque Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Roque Epic!")
}
elsif($ulevel == 65 && $class == 'roque' && plugin::check_handin(\%itemcount, 52348 => 1)) { #Roque epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119476); #Roque Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Roque Epic!")
}
elsif($ulevel == 65 && $class == 'roque' && plugin::check_handin(\%itemcount, 119476 => 1)) { #Roque epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119492); #Roque Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Roque Epic!")
}
######################################################################--BEGIN MONK--####################################################################################
elsif($ulevel == 65 && $class == 'monk' && plugin::check_handin(\%itemcount, 10652 => 1)) { #Monk epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(61025); #Monk Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Monk Epic!")
}
elsif($ulevel == 65 && $class == 'monk' && plugin::check_handin(\%itemcount, 61025 => 1)) { #Monk epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(67742); #Monk Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Monk Epic!")
}
elsif($ulevel == 65 && $class == 'monk' && plugin::check_handin(\%itemcount, 67742 => 1)) { #Monk epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119477); #Monk Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Monk Epic!")
}
elsif($ulevel == 65 && $class == 'monk' && plugin::check_handin(\%itemcount, 119477 => 1)) { #Monk epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119493); #Monk Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Monk Epic!")
}
######################################################################--BEGIN BEASTLORD--####################################################################################
elsif($ulevel == 65 && $class == 'beastlord' && plugin::check_handin(\%itemcount, 8495 => 1 or 8496 => 1)) { #Beastlord epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(52911); #Beastlord Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Beastlord Epic!")
}
elsif($ulevel == 65 && $class == 'beastlord' && plugin::check_handin(\%itemcount, 52911 => 1)) { #Beastlord epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(57054); #Beastlord Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Beastlord Epic!")
}
elsif($ulevel == 65 && $class == 'beastlord' && plugin::check_handin(\%itemcount, 57054 => 1)) { #Beastlord epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119478); #Beastlord Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Beastlord Epic!")
}
elsif($ulevel == 65 && $class == 'beastlord' && plugin::check_handin(\%itemcount, 119478 => 1)) { #Beastlord epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119494); #Beastlord Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Beastlord Epic!")
}
######################################################################--BEGIN BARD--####################################################################################
elsif($ulevel == 65 && $class == 'bard' && plugin::check_handin(\%itemcount, 20542 => 1)) { #Bard epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(77631); #Bard Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Bard Epic!")
}
elsif($ulevel == 65 && $class == 'bard' && plugin::check_handin(\%itemcount, 77631 => 1)) { #Bard epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(77640); #Bard Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Bard Epic!")
}
elsif($ulevel == 65 && $class == 'bard' && plugin::check_handin(\%itemcount, 77640 => 1)) { #Bard epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119479); #Bard Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Bard Epic!")
}
elsif($ulevel == 65 && $class == 'bard' && plugin::check_handin(\%itemcount, 119479 => 1)) { #Bard epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119495); #Bard Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Bard Epic!")
}
######################################################################--BEGIN PALADIN--####################################################################################
elsif($ulevel == 65 && $class == 'paladin' && plugin::check_handin(\%itemcount, 10099 => 1)) { #Paladin epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(64031); #Paladin Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Paladin Epic!")
}
elsif($ulevel == 65 && $class == 'paladin' && plugin::check_handin(\%itemcount, 64031 => 1)) { #Paladin epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(48147); #Paladin Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Paladin Epic!")
}
elsif($ulevel == 65 && $class == 'paladin' && plugin::check_handin(\%itemcount, 48147 => 1)) { #Paladin epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119480); #Paladin Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Paladin Epic!")
}
elsif($ulevel == 65 && $class == 'paladin' && plugin::check_handin(\%itemcount, 119480 => 1)) { #Paladin epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119496); #Paladin Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Paladin Epic!")
}
######################################################################--BEGIN BERSERKER--####################################################################################
elsif($ulevel == 65 && $class == 'berserker' && plugin::check_handin(\%itemcount, 68299 => 1)) { #Berserker epic 1.0 to 1.5
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(18398); #Berserker Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Berserker Epic!")
}
elsif($ulevel == 65 && $class == 'berserker' && plugin::check_handin(\%itemcount, 18398 => 1)) { #Berserker epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(18609); #Berserker Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Berserker Epic!")
}
elsif($ulevel == 65 && $class == 'berserker' && plugin::check_handin(\%itemcount, 18609 => 1)) { #Berserker epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119481); #Berserker Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Berserker Epic!")
}
elsif($ulevel == 65 && $class == 'berserker' && plugin::check_handin(\%itemcount, 119481 => 1)) { #Berserker epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119497); #Berserker Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Berserker Epic!")
}
######################################################################--BEGIN RANGER--####################################################################################
elsif($ulevel == 65 && $class == 'ranger' && plugin::check_handin(\%itemcount, 20488 => 1 or 20487 => 1)) { #Ranger epic 1.0 to 1.5 || plugin::check_handin(\%itemcount, 204887 => 1)
$client->Message(14,"You have agreed to our deal, here is your epic 1.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(62627); #Ranger Epic 1.5
quest::level(10); #Set level to 10
quest::shout2("Please congratulate!! $name is now working on the 1.5 Ranger Epic!")
}
elsif($ulevel == 65 && $class == 'ranger' && plugin::check_handin(\%itemcount, 62627 => 1)) { #Ranger epic 1.5 to 2.0
$client->Message(14,"You have agreed to our deal, here is your epic 2.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(62649); #Ranger Epic 2.0
quest::level(20); #Set level to 20
quest::shout2("Please congratulate!! $name is now working on the 2.0 Ranger Epic!")
}
elsif($ulevel == 65 && $class == 'ranger' && plugin::check_handin(\%itemcount, 62649 => 1)) { #Ranger epic 2.0 to 2.5
$client->Message(14,"You have agreed to our deal, here is your epic 2.5 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119482);#Ranger Epic 2.5
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 2.5 Ranger Epic!")
}
elsif($ulevel == 65 && $class == 'ranger' && plugin::check_handin(\%itemcount, 119482 => 1)) { #Ranger epic 2.5 to 3.0
$client->Message(14,"You have agreed to our deal, here is your epic 3.0 weapon. I shall start the ancient chanting now to drain your lifeforce, as agreed in the contract you just signed, this is irreversable!!");
$client->Message(6,"You notice a strange wind comming up as the old man places his hand on your forehead: did you make a pact with the devil himself?");
$client->Message(6,"You are starting to feel strange as the old man begins to chant in an ancient old language, you feel your lifeforce draining away as you hear him screem: ARGOSS BEHILIA DEMBOLA!!!!");
$client->Message(6,"When everything gets back to normal you notice that you forgot all about fighting, you notice you have lost ALOT of combat experience!!");
quest::summonitem(119498);#Ranger Epic 3.0
quest::level(30); #Set level to 30
quest::shout2("Please congratulate!! $name is now working on the 3.0 Ranger Epic!")
}
######################################################################--THE END--####################################################################################
else {
$client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
plugin::return_items(\%itemcount);
return 1;
}
}
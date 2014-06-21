sub EVENT_SAY {
my $Agnostic = quest::saylink("Agnostic", 1);
my $Rallos_Zek = quest::saylink("Rallos_Zek", 1);
my $The_Tribunal = quest::saylink("The_Tribunal", 1);
my $Brell_Serilis = quest::saylink("Brell_Serilis", 1);
my $Bristlebane = quest::saylink("Bristlebane", 1);
my $Erollisi_Marr = quest::saylink("Erollisi_Marr", 1);
my $Karana = quest::saylink("Karana", 1);
my $Mithaniel_Marr = quest::saylink("Mithaniel_Marr", 1);
my $Prexus = quest::saylink("Prexus", 1);
my $Quellious = quest::saylink("Quellious", 1);
my $Rallos_Zek = quest::saylink("Rallos_Zek", 1);
my $Rodcet_Nife = quest::saylink("Rodcet_Nife", 1);
my $Solusek_Ro = quest::saylink("Solusek_Ro", 1);
my $The_Tribunal = quest::saylink("The_Tribunal", 1);
my $Tunare = quest::saylink("Tunare", 1);
my $Veeshan = quest::saylink("Veeshan", 1);
my $North_Freeport = quest::saylink("North_Freeport", 1);
my $South_Qeynos = quest::saylink("South_Qeynos", 1);
my $Greater_Faydark = quest::saylink("Greater_Faydark", 1);

if (($text=~/Bard/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("A Fine choice, the Way of the Bard, but I have a few more questions for you. Which Deity did you choose? $Agnostic, $Brell_Serilis, $Bristlebane, $Erollisi_Marr, $Karana, $Mithaniel_Marr, $Prexus, $Quellious, $Rallos_Zek, $Rodcet_Nife, $Solusek_Ro, $The_Tribunal, $Tunare or $Veeshan?");
  }
  if (($text=~/Agnostic/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Agnostic? A Good Choice, So you will not commit to the existence or non-existence of any Deity. This is your choice.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
	}
  if (($text=~/Brell_Serilis/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Brell Serilis? A Good Choice, Followers of The Duke of below believe that the surface world is a waste of space and prefer to explore caves and caverns.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Bristlebane/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Bristlebane? A Good Choice, Followers of The King of thieves believe in having fun at the expense of nearly all else.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or Greater_Faydark.");
  }
  if (($text=~/Erollisi_Marr/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Erollisi Marr? A Good Choice, Followers of The Queen of Love believe that love can conquer all, while not being naive about it.");
    quest::say("On your way then, I will send you to North Freeport. Hand this note to Caskin Marsheart, He is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Grunson in East Freeport and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(18747);
	quest::movepc(8,318,554,4);
  }
  if (($text=~/Karana/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Karana? A Good Choice, Followers of The Rainkeeper believe in the absolute power of storms.");
    quest::say("On your way then, I will send you to South Qeynos. Hand this note to Belious Naliedin, He is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Novalu in South Qeynos and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(119843);
	quest::movepc(1,-140,521,3);
  }
  if (($text=~/Mithaniel_Marr/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Mithaniel Marr? A Good Choice, Followers of The Lightbearer believe that valor is what separates civilized beings from beasts. You must have a strict moral code that prizes truth, honor and charity.");
    quest::say("On your way then, I will send you to North Freeport. Hand this note to Caskin Marsheart, He is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Grunson in East Freeport and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(18747);
	quest::movepc(8,318,554,4);
  }
  if (($text=~/Prexus/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of Prexus? A Good Choice, Followers of The Oceanlord believe in power that lies in the vast depths of Norrath's Oceans.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Quellious/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of Quellious? A Good Choice, Followers of The Tranquil seek peace. They are not strict pacifists, however, they will fight and defend themselves and those they care about.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Rallos_Zek/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Rallos Zek? A Good Choice, Followers of The Warlord believe in the survival of the strong and extinction of the weak.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Rodcet_Nife/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Rodcet Nife? A Good Choice, Followers of The Prime Healer take oath to fight disease and death until one or the other takes them.");
    quest::say("On your way then, I will send you to South Qeynos. Hand this note to Belious Naliedin, He is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Novalu in South Qeynos and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(119843);
	quest::movepc(1,-140,521,3);
  }
  if (($text=~/Solusek_Ro/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Solusek Ro? A Good Choice, Followers of The Burning Prince in the raw and unbridled power of fire. Fire birthed the world andin fire shall it be consumed");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/The_Tribunal/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of The Six Hammers? The Tribunal seelone thing above all else, justice.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/Tunare/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of Tunare? A Good Choice, Followers of the Mother of all believe we are all Tunare's children and seek to help Norrath.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
   if (($text=~/Veeshan/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("Following the way of Veeshan? A Good Choice, Non-dragon followers of The Wurmqueen believe that dragonkind is superior to all other forms of life.");
    quest::say("One more question for you $name, What city would you prefer to be sent to? $North_Freeport, $South_Qeynos or $Greater_Faydark.");
  }
  if (($text=~/North_Freeport/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("On your way then, I will send you to North Freeport. Hand this note to Caskin Marsheart, He is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Grunson in East Freeport and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(18747);
	quest::movepc(8,566,-136,17);
  }
  if (($text=~/South_Qeynos/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("On your way then, I will send you to South Qeynos. Hand this note to Belious Naliedin, He is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Novalu in South Qeynos and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(119843);
	quest::movepc(1,-140,521,3);
  }
  if (($text=~/Greater_Faydark/i) && ($ulevel == 1) && ($class eq "Bard")) {
    quest::say("On your way then, I will send you to Kelethin. Hand this note to Sylia Windlehands. She is your Guildmaster of the Bards."); 
	quest::say("Be sure you find Soulbinder Oakstout in Kelethin and have yourself bound to the area before you venture out. Good luck $name.");
	quest::summonitem(18783);
	quest::movepc(54,248,-239,76);
	}
  if ($text=~/Hail/i){
    quest::say("Welcome, my name is Belious Naliedin of the League of Antonican Bards. A few years ago, I had finally saved up the money, and I bought this place. I settled in, and have been [working] here ever since.");
  }
  if ($text=~/working/i) {
    quest::say("Ah, this is my shop. I am a musician, well known for my ability both in tuning, and [building instruments.]");
  }
  if ($text=~/building/i) {
    quest::say("Young bards are often not the wealthiest people in Norrath, and oftentimes, they have nothing to accompany their beautiful voices when they sing. If young bards are able to locate, and bring to me the [various parts] to assemble a lute with, I provide the labor for free.");
  }
  if ($text=~/parts/i) {
    quest::say("If you are able to find an unfinished lute body, an unfinished lute neck, a box of lute strings, and a set of fine lute tuners I will be able to craft for you one of the best sounding lutes that you have ever heard in your young life, and it will be yours, free of charge. It has long been my desire to help out any young men and women who wish to explore the bardic arts.");
  }
  if ($text=~/i seek a famous bard/i) {
    quest::say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
  }
  if ($text=~/i seek an audience with him/i) {
    quest::say("Ah! In order to gain an audience with him, you must have a letter of introduction from me, otherwise he will not give you the time of day.");
    quest::emote("laughs briefly.");
  }
  if ($text=~/give me a letter of introduction/i) {
    quest::emote("looks around.");
    quest::say("Well, you want a letter of introduction, eh? I think that fifty shiny platinum pieces sounds like a good introduction to me, my friend.");
  }
}

sub EVENT_ITEM { 
my $Bard = quest::saylink("Bard", 1);
if (plugin::check_handin(\%itemcount, 18717 => 1) && $class eq "Bard") { 
  quest::say("I am the Belious Naliedin of the League of Antonican Bards. A few years ago, The Rathe server was created in order to bring back the feel of the orginal EQ zones. Many things have changed over the years and with those changes, some things could not be done anymore.");
    quest::say("You were sent to me because there is a problem with getting you to the correct city with the correct guild summons.");
	quest::say("Since you are talking to me I must assume you are a $Bard?");
	}
  elsif (plugin::check_handin(\%itemcount, 119843 => 1) && $class eq "Bard") { 
      quest::say("Good day friend, and welcome to the Wind Spirit's Song. Thank you for joining our cause. Go speak with Jusean Evanesque; I'm sure you'll fit in well.");
    quest::summonitem(13502);
     quest::ding();
	 quest::faction(135, 10); 	#Guards of Qeynos
    quest::faction(9, 10);  #Antonius Bayle
    quest::faction(192, 10);  #League of Antonican Bards
    quest::faction(207, -30);  #Mayong Mistmoore
    quest::faction(273, -30);  #Ring of Scale
	quest::exp(1000);
  }
   else {
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Bard');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
  }
 
  
  if (plugin::check_handin(\%itemcount, 20374 => 1)) {
    quest::say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
     quest::ding(); quest::exp(100);
  }
  elsif ($platinum >= 50) {
    quest::say("Ah! Here is that letter of introduction I was looking for! Baenar likes to frequent a serene fountain in the southern Karanas. He finds the peace there accommodating to his work. He may even sing a tale for you if the mood strikes him.");
    quest::summonitem(20373);
  }
  elsif (plugin::check_handin(\%itemcount, 13775 =>1, 13776 =>1, 13777 =>1, 13778 =>1 )) {
   quest::summonitem(13105); 
    quest::ding(); quest::exp(1000);
   quest::say("Here is your custom lute, use it well $name.");
  }
  else {
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Bard');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }


#END of FILE Zone:qeynos  ID:1133 -- Belious_Naliedin 


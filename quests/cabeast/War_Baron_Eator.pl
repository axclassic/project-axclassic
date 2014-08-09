sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::emote(' turns to you and snorts in anger. Some mucus lands on your cheek.');
        quest::say("Troopers! I thought I ordered you to keep all new recruits away from this chamber! Go, child. The War Baron of Cabilis has no time for games. See this intruder out!!");
 }
 if ($text=~/memory/i) {
   quest::emote(' takes a step back and thinks to himself. Phlegm dribbles off his lips.');
   quest::say("The Memory of Sebilis. Kept within my personal chambers. They have been taken. Taken by some croakin' Forsaken no doubt!! You have been sent to me because you show excellent prowess. Find my Memory and bring it to me with your footman's pike.");
 }
 if ($text=~/trooper/i) {
   quest::say("So you are a trooper? Word of your deeds has been spreading through the legion. If you truly wield the pike of a trooper, then go and serve the garrisons of swamp, lake and woods. Report to the Warlord and tell him you are a [trooper reporting for duty]. Their recommendations and your trooper pike shall earn you the rank of legionnaire.");
 }
  if ($text=~/welfare/i) {
   quest::emote(' looks up from his meditation and stares at you with piercing eyes.');
   quest::say("What do you know of our welfare? Do you think just because you have $helped serve the Legion you are better than any other legionnaire to know our secrets?"); 
}
  if ($text=~/helped/i) {
   quest::emote(' sighs deeply as his facial expressions change to more of deep sorrow.');
   quest::say("Yes. . . yes you have. I am sorry but time has grown short in our latest attempts to locate the $Warlord I sent to gather $information."); 
}
  if ($text=~/information/i) {
   quest::say("You do not need to know the information he sought. All you need to know is that you must $find our brethren."); 
}
  if ($text=~/Warlord/i) {
   quest::say("That is for you to find out for us now if you choose to. Last we heard was that he had been in contact with another of our warlords."); 
   quest::say("A good place to find information would be talk to the vendors in West Cabilis, they hear many things.");
}
  if ($text=~/findings/i) {
   quest::say("It seems we have no clue as to why Xyzith turned against us. We need you to find where he traveled and get down to the bottom of this mystery. Go speak to Geot. He was the closest to Xyzith. He may remember where Xyzith searched for the legendary metal."); 
 }
}
sub EVENT_ITEM {
my $trooper = quest::saylink("trooper", 1);
my $true = quest::saylink("true", 1);
my $findings = quest::saylink("findings", 1);
 if(plugin::check_handin(\%itemcount, 18464 => 1, 22919 => 1)){
  quest::emote(' smiles at your dedication to Cazic Thule and hands you a small gem.');
  quest::summonitem(7881);
   quest::ding(); quest::exp(20000);
  
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 18463 => 1, 22918 => 1)){
  quest::emote(' smiles at your dedication to Cazic Thule and hands you a small gem.');
  quest::summonitem(7881);
  quest::ding();
  quest::exp(20000);
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif (plugin::check_handin(\%itemcount, 12899 =>1, 12898 =>1, 12896 =>1, 5132 =>1 )) {
  quest::emote(' gulps down a wad of phlegm.');
  quest::say("My memory has returned! Boneripper! You are no footman. I grant you the rank of soldier. Go and forge your weapon. Do not return to me until you become a brave $trooper of the empire.");
  quest::say("Find Drill Master Kyg, he needs help with a task.");    #not live text, link to 4th pike beginning
  quest::summonitem(12476);
  quest::faction( 30,2);
  quest::faction( 193,2);
  quest::faction( 282,2);
  quest::faction( 317,2);
  quest::faction( 62,2);   
  quest::ding();
  quest::exp(800);
}
 elsif (plugin::check_handin(\%itemcount, 18073 => 1, 18072 => 1, 18074 => 1, 5134 => 1 )) {
  quest::emote("takes away your pike and hands you plans not for a pike head, but for the crown of another polearm.");
  quest::say("It is time to wield the weapon of a $true warrior of the legion. You have done well, Legionnaire $name!");
  quest::summonitem(12478);
  quest::faction( 30,2);
  quest::faction( 193,2);
  quest::faction( 282,2);
  quest::faction( 317,2);
  quest::faction( 62,2);
  quest::ding();
  quest::exp(4000);
}
  elsif(plugin::check_handin(\%itemcount, 48026 => 1)){
  quest::say("Ah, I see you have gained the approval of another. I suppose you are the one I should share our $findings with then.");
  quest::ding();
  quest::exp(500);
  quest::faction( 30,2);
  quest::faction( 193,2);
  quest::faction( 282,2);
  quest::faction( 317,2);
  quest::faction( 62,2);
 }
  elsif(plugin::check_handin(\%itemcount, 48020 => 1)){
  quest::say("What is this?! This cannot be true. What has happened to Xyzith to make him so against those he served so proudly? I must get to the bottom of this. I shall however reward you for courage against him. Take this and replace that which you have defeated!");
  quest::summonitem(12481);
  quest::faction( 30,2);
  quest::faction( 193,2);
  quest::faction( 282,2);
  quest::faction( 317,2);
  quest::faction( 62,2);
  quest::ding();
  quest::exp(6000);
  }
  elsif(plugin::check_handin(\%itemcount, 48030 => 1)){
  quest::say("I see you have figured out the issue and ended it as well. The Legion. . .no. . .I owe you much thanks. It is regretful that Xyzith did not come back to us safely but we will all be in good hands with you here. Take these plans for the Pride of the Legion, and protect those as Warlord Xyzith did. Speak to Weaponsmith Gurgl to learn how to make your weapon of great power.");
  quest::summonitem(12482);
  quest::faction( 30,2);
  quest::faction( 193,2);
  quest::faction( 282,2);
  quest::faction( 317,2);
  quest::faction( 62,2);
  quest::ding();
  quest::exp(10000);
  }
  else {
  #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
    }
 }
##############################
## Tuggins_Warstring
## Phase 3 of Betrayal Line 
## Resqu Miplez 
## APRIL 2013 
##############################

sub EVENT_SAY{
my $story = quest::saylink("story",1);
my $yes = quest::saylink("Yes",1);
my $no = quest::saylink("No",1); 
my $who = quest::saylink("who",1);
my $armor = quest::saylink("armor",1);
my $loyalty = quest::saylink("loyalty",1);
my $restored = quest::saylink("restored",1);
my $deserving = quest::saylink("deserving",1);
my $shall = quest::saylink("Shall",1);
my $teach = quest::saylink("teach",1);

if ($text =~ /hail/i && $faction <= 3){
 $client->Message(14,"Good day $name! What brings you to these parts? Perhaps some time away from the world or maybe looking for a good $story?");
}
if ($text =~ /hail/i && $faction > 3){
 $client->Message(14,"Good day $name! I am just here writing a bit of history down maybe I can talk to you later.");
}
if ($text =~ /story/i){
 $client->Message(14,"Ah yes! I have a great story of the betrayal! Would you like to hear it? $yes or $no");
}
if ($text =~ /yes/i){
 $client->Message(14,"Well my friend, a long time ago, there was a hall below the city of Chardok. There was the leader of the Halls, his name was Xo Nieng. Afraid he would lose power, he figured out a way to make his people become loyal forever. The catch they had to be willing. I know you would be wondering $who would willing serve a mortal forever?");
}
if ($text =~ /no/i){
 $client->Message(14,"That's too bad I find it a fascinating story. However I bet some one like you is only interested in the $armor.");
}
if ($text =~ /who/i){
 $client->Message(14,"You see, those who were willing, does not mean that they were knowing. No, he had convinced them that he would bring them safety as long as they served him. Oh how he fulfilled his promises! They were protected and successful. The items they created rivaled the $armor of the gods. They grew strong, the citizens felt safe in their home, and trusted Xo Nieng. This was when Xo Nieng asked them to prove their $loyalty.");
}
if ($text =~ /loyalty/i){
 $client->Message(14,"In order to prove their loyalty they each sealed the pledge in blood. Xo now had what he needed to cast his most vile spell, reveling for the first time his true nature. A necromancer! True to form, betrayed them all by filling the halls with poison as they slept. Since no one knew of the betrayal, they remained loyal. Then turned to the undead beings that serve him today. Their souls and $armor trapped in the halls forever. ");
}
if ($text =~ /armor/i){
 $client->Message(14,"As you have already seen, the armor can be $restored and currently you are just halfway through.");
}
if ($text =~ /restored/i){
 $client->Message(14,"Mmmm... I could tell you, but how do I know you are capable and $deserving of such items?");
}
if ($text =~ /deserving/i){
 $client->Message(14,"Well we shall test your ability. Only then, shall I share the way to make the improvements. $shall we start?");
}
if ($text =~ /shall/i){
 $client->Message(14,"Well here it goes. Good luck on figuring this out.");
 $client->Message(14,"As in nature there are four.");
 $client->Message(14,"All the mighty hold in store.");
 $client->Message(14,"But rarely do they share.");
 $client->Message(14,"So to their place if you dare.");
 $client->Message(14,"combine in box to get the key.");
 $client->Message(14,"Only then will you learn from me! Yeah, Yeah, It bites but I am a dwarf not some twig of an elf! Good luck.");
}
if ($text =~ /teach/i){
 $client->Message(14,"To make the Elemental Lacquer, you must take four Mephits blood of the same element, and concentrate in an oven. You will take the concentrated Mephit blood from each one and fire it in a kiln. The results will be your lacquer which you will place in the box with your Jeweled or reinforced items. This will imbue your item with power and then you will only be one more $step away to restoring the full power.");
}
if ($text =~ /step/i){
 $client->Message(14,"All I know about that is you will have to be powerful and patient in order to complete it. I believe the only person to possess that knowledge would be Xo Nieng's youngest brother which resides somewhere in their home city.");
 }
}

sub EVENT_ITEM{
if ($text =~ /teach/i){
  if(plugin::check_handin(\%itemcount,{119820} => 1)){
    quest::say("Ho!Ho! You have managed to complete it. Indeed my hat is off to you! Well, I guess it is my turn to keep my part of the bargain. So I will $teach you how to create the elemental lacquer to coat the betrayal items which will imbue them with power.");
quest::faction(2767,120);
quest::exp(20000);
    return 1;
  }
else {
        $client->Message(14,"Why are you giving me this?");
        plugin::return_items(\%itemcount);
	    return 1;
}
}

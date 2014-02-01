######################################
## NPC: Xeture_Demiagar ##
## Zone: Qcat - Cleric GM ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $serve = quest::saylink("serve", 1);
my $enemies = quest::saylink("enemies", 1);
my $instruction = quest::saylink("instruction", 1);
my $note = quest::saylink("note", 1);

if ($text=~/hail/i) {
$client->Message(14,"I have much to do here for the defense of our Temple and the appeasing of our patron Bertoxxulous, the Plague Lord. If the Plague Lord has gifted you with the desire to $serve his will as a priest of the Bloodsabers I will assist in your training. Did you have a $note?If not, then leave me now and do not interrupt me again.");
}
if ($text=~/note/i) {
$client->Message(14,"Yes the little paper you got when you started, give it to me please!");
}
if ($text=~/serve/i) {
$client->Message(14,"By spreading the disease, decay, and destructive powers of the Plague Lord you will in turn be gifted with great insight and power. First however you must learn to survive in this city, surrounded by those who would see you destroyed for your faith. Take this note to Torin Krentar. He will instruct you on how to acquire a suit of armor to protect you from the weapons of our $enemies.");
quest::summonitem(20207);
}
if ($text=~/enemies/i) {
$client->Message(14,"The self-righteous ruler of this city, Antonius Bayle IV, is backed by the Knights of Thunder, paladins and clerics of the Storm Lord Karana, and the Temple Life, paladins and clerics of the Prime-Healer, Rodcet Nife. Be wary when not within the security of our temple here in the Qeynos Catacombs, should the Qeynos Guards discover you allegiances they would have you executed. Once you have been properly armored return to me and I will give you further $instruction.");
}
if ($text=~/instruction/i) {
$client->Message(14,"The Priests of Life, those who claim allegiance to the Prime Healer, Rodcet Nife, have proven to be a large obstacle in our conversion of the people of Qeynos to the ways of the Plague Bringer. Lately a Priest of Life by the name of Rolon Banari has been campaigning amongst the beggars and sickly, a social group from which we have gained many converts. Find this meddling priest and bring me his head.");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 20197 => 1)) {
$client->Message(14,"You have done well, $name. Take this Rusty Bloodsaber Mace to a forge and clean it up with a Sharpening Stone. It may take you several attempts to get all the rust off if you are not familiar with the process. Once that is done take the Refined Bloodsaber Mace to Torin Krentar with a Giant King Snake Skin and he will put the finishing touches on the weapon.");
quest::summonitem(20198);
}

if (plugin::check_handin(\%itemcount, 18716 =>1 )) {
$client->Message(14,"Good work $name, Thank you for the note, yes i had received word that a young Cleric was coming to join our realms. I am here to see to it that you start your training as soon as possible.");
quest::ding();
quest::exp(500);
quest::faction(21,1);
quest::faction(135,-1);
quest::faction(235,-1);
quest::faction(257,-1);
quest::faction(53,1);
quest::givecash(0,3,3,0);
}

else {
plugin::return_items(\%itemcount);
$client->Message(14,"I don't need these, it is NOT what i asked for. Take them back and move along please!");
}
}

# EOF zone: qcat ID: 45089 NPC: Xeture Demiagar
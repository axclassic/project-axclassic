######################################
## NPC: Runethar_Hamest ##
## Zone: Quenos Paladin handin GM ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $guidance = quest::saylink("guidance", 1);

if ($text=~/Hail/i){
$client->Message(14,"Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you need $guidance?");
}
if($text=~/guidance/i){
$client->Message(14,"Excellent news $name. You need to seek out Miltiades Tal-Azroth. He is right here in the Paladin Guild.");
}
}
sub EVENT_ITEM {
if ($item1=="18710"){
$client->Message(14,"Thanks $name. Now you need to seek out Miltiades Tal-Azroth. He is right here in the Paladin Guild.");
    quest::summonitem(13505); #Old Gray Tunic
	quest::ding();
    quest::faction( 135, 10);  #Guards of Qeynos
    quest::faction( 183, 10);  #Knights of Thunder
    quest::faction( 257, 10);  #Priests of Life
    quest::faction( 21, -30);  #Bloodsabers
   	quest::exp(1000);
	quest::rebind(1,-510,-145,6);
	}
  else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:qeynos ID:1136 -- Runethar_Hamest


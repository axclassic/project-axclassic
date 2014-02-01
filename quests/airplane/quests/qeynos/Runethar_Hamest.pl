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
quest::summonitem("13505");
quest::ding(); quest::exp("100");
}
else {
#do all other handins first with plugin, then let it do disciplines
plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:qeynos ID:1136 -- Runethar_Hamest


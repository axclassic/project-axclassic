######################################
## NPC: Glorin_Binfurr ##
## Zone: ButcherBlock Docks ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $ship = quest::saylink("ship", 1);
my $service = quest::saylink("service", 1);
my $carry = quest::saylink("carry", 1);
my $ghost = quest::saylink("ghost", 1);

if($text=~/Hail/i){
$client->Message(14,"Pleasure to meet you. Keep your eye out for the $ship. You don't want to miss it.");
$npc->CastSpell(261,$userid);
}
elsif($text=~/ship/i){
quest::emote("looks up dreamily");
$client->Message(14,"Aye, the good ship SirensBane, did us all a great $service in her day ...");
}
elsif($text=~/service/i){
quest::emote("sadly recalls");
$client->Message(14,"Used to $carry many adventurer to the Ocean of Tears, even as far as Freeport.");
}
elsif($text=~/carry/i){
quest::emote("sighs");
$client->Message(14,"All that's left of her now, is a $ghost of a memory ....");
}
elsif($text=~/ghost/i){
$client->Message(14,"Walk into the ghost, she might help you get on your way - and don't ever forget the SirensBane ...");
$npc->CastSpell(269,$userid);
}
}
#END of FILE Zone:butcher ID:68064 -- Glorin_Binfurr
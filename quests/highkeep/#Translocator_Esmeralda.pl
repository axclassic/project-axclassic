######################################
## NPC: #translocator Esmeralda ##
## Zone: HighPass##
## Angelox ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $Kithicor = quest::saylink("Kithicor", 1);
my $Karana = quest::saylink("Karana", 1);
if($text=~/Hail/i){
$client->Message(14,"Hello there. If you play in the world of Secrets of Faydwer, you will not be able to enter Highpass Hold. If you need to pass though Highpass and get to $Kithicor or $Karana, I can transport you to my companion there.");
}
if($text=~/Kithicor/i){
quest::movepc(20,4899.2,432.2,680.6); }
elsif($text=~/Karana/i){
quest::movepc(15,-7914.0,-3103.2,678.9); }
}

#End of File - 

######################################
## NPC: #Translocator_Estrella ##
## Zone: EastKarana##
## Angelox ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $HighKeep = quest::saylink("HighKeep", 1);
if($text=~/Hail/i){
$client->Message(14,"Hello there. If you play in the world of Secrets of Faydwer, you will not be able to enter Highpass Hold. If you need to pass though Highpass and get to $HighKeep, I can transport you to my companion there.");
}
if($text=~/highkeep/i){
quest::movepc(6,59.1,-15.0,3.1); }
}

#End of File -

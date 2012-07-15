######################################
## NPC: #translocator Jempar ##
## Shaman Epic 1 ##
## Zone: Erud's Crossing (erudsxing)##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SAY {
my $erudin = quest::saylink("Erudin", 1);
my $qeynos = quest::saylink("Qeynos", 1);
if($text=~/Hail/i){
$client->Message(14,"Hello there. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to travel to $erudin or travel to $qeynos in the meantime, I can transport you to my companion there.");
}
if($text=~/erudin/i){
quest::selfcast("2290"); }

if($text=~/qeynos/i){
quest::selfcast("2288"); }
}


sub EVENT_SIGNAL {
if($signal == 199) {
quest::spawn2(98046,0,0,4210.0,-1610.0,-287.3,0.0);
quest::signalwith(98009,199,10000);
}
}

#End of File - NPCID 98045 - #Translocator_Jempar
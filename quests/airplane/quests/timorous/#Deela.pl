######################################
## NPC: #Deela ##
## Zone: Timorous ##
## Revised by caved for AX-CLASSIC ##
## EQWorld Server ##
######################################

sub EVENT_SPAWN{
$x = $npc->GetX();
$y = $npc->GetY();
quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
quest::delglobal("shutc");
quest::setglobal("shutc",0,7,"F");
$shutc=undef;
quest::delglobal("maidnc");
quest::setglobal("maidnc",0,7,"F");
$maidnc=undef;}

sub EVENT_SAY {
my $overthere = quest::saylink("Overthere", 1);
my $firiona = quest::saylink("Firiona", 1);
my $oasis = quest::saylink("Oasis", 1);
my $butcherblock = quest::saylink("Butcherblock", 1);
if ($text=~/Hail/i){
$client->Message(14,"Hello there. The ships are working again, my work here is done and I'm waiting for my ride home.If you want want to know more about transportation to $overthere, $oasis, $firiona, or $butcherblock. I can give you directions.");
}
if ($text=~/butcher/i){
$client->Message(14,"The Captains Skiffs should arrive here soon, you might have to wait a while ...");
}
if ($text=~/overthere/i){
$client->Message(14,"The Bloated Belly docks at the ogre camp");
}
if ($text=~/oasis/i){
$client->Message(14,"Take the raft north of the ogre camp");
}
if ($text=~/firiona/i){
$client->Message(14,"Take the Island Shuttle to Firiona Vie");
}
}

sub EVENT_ENTER{
if (($shuta==40) && ($maidna==8) && ($shutc==0)){ # Shuttle made it's run, is idle, and MaidenV is there
quest::delglobal("shuta");
quest::setglobal("shuta",1,7,"F");
$shuta=undef;
quest::spawn2(96075,20,0,-2380,-3963,-4,103.6); #spawn the Island Shuttle
quest::delglobal("shutb");
quest::setglobal("shutb",40,7,"F");
$shutb=undef;
}
if (($shuta < 40)&&($shutc==0)){ #Shuttle (shuta) not at 40 so we need to check
quest::delglobal("shutc");
quest::setglobal("shutc",1,7,"F");
$shutc=undef;
}
if (($maidna==40)&&($maidnc==0)) { #MaidenV (maidna) is at 40, so not in use, spawn incoming
quest::spawn2(96301,30,0,-2930,-1435,-20,118.25);
# quest::shout("Deela spawn!");
quest::delglobal("maidna");
quest::setglobal("maidna",1,7,"F");
$maidna=undef;
}
if (($maidna < 40)&&($maidnc==0)){ #MaidenV (maidna) not at 40 so we need to check
$maidna=undef;
quest::delglobal("maidnc");
quest::setglobal("maidnc",1,7,"F");
$maidnc=undef;
}
if (($skiffc ==0) || ($skiffa >=0) && ($skiffa <=39)){ #Captains Skiffs
quest::delglobal("skiffc");
quest::setglobal("skiffc",1,7,"F");
$skiffc=undef;
}
}
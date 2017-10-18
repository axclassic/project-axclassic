#angelox
#Sonic Guardian
sub EVENT_SIGNAL {
 if ($astate==1){
 quest::shout("To arms! The grimlins are attacking the Sonic camp!");
}
 elsif ($astate==2){
quest::shout("To arms! Owlbears are attacking the Sonic camp!");
}
}

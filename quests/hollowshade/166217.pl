#angelox
#Owlbear Lookout
sub EVENT_SIGNAL {
 if ($astate==1){
 quest::shout("To arms! The grimlins are attacking the Owlbear camp!");
}
 elsif ($astate==3){
quest::shout("To arms! Sonics are attacking the Owlbear camp!");
}
}

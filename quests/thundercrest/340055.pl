##Attackable Artifact_of_Yar`Lir 340055##
sub EVENT_DEATH {
quest::signalwith(340056,317,0); ##client mesage##
quest::depop(340056); ##depop History_controller##
}
#################################
#Stage Five of Grokal line      #
#Betrayal Quest Line Phase 4    #
#Resqu Miplez                   #
#Date 5/5/13                    #
#################################

sub EVENT_SPAWN{
    quest::settimer("Dgrokal",7200); #depop after 2 hours
}
sub EVENT_DEATH {
  
    quest::say("I will return to defeat you and complete my betrayal of all of Norrath!");

}

sub EVENT_TIMER {
if ($timer eq "Dgrokal") {
quest::depop();
}
 }

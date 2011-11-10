#npc - Freport Guards
#zone - Freportn
#by Angelox

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
   if(($combat_state == 1) &&($random_result<=20)){
    quest::say("Time to die, $name/!");
    quest::say("Filthy Scumsuckers like you must die!");
   }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("Time to die, $name/!");
    quest::say("Your actions and history are a personal affront to all I stand for!");
   }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("Time to die, $name/!");
    quest::say("I shall rid the land of another infamous villain!");  
   }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("Time to die, $name/!");
    quest::say("Your foul deeds have earned my contempt!");
   }elsif($combat_state == 1){
    quest::say("Time to die, $name/!");
    quest::say("Your intolerable reputation insults all in this realm!");}
}

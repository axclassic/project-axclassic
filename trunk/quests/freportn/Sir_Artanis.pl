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

sub EVENT_SAY {
 if($text=~/Befallen/i){
  quest::say("You did well to ride swiftly with this news. I must take this directly to Valeron Dushire. If you learn more about this plot that would unleash this monster upon Norrath or wish to someday soon aid the Knights of Truth in putting down this evil, then return to speak to me again at a later time.");
  }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount,18474 =>1)){
  quest::say("By Marr, what is this? ...'Burning Dead'...Marnek! By my blade, this must be stopped! Where did you find this?");
  quest::faction(184,10); #Knights of Truth
  quest::faction(86,-30); #Dismal Rage
  quest::faction(105,-30); #The Freeport Militia
  quest::faction(258,10); #The Priests of Marr
  quest::faction(311,10); #Steel Warriors
  quest::exp(6400);
  quest::ding();
  quest::givecash(10,8,0,0);
 }
 if(plugin::check_handin(\%itemcount,31492 => 1)){
  quest::say("It was a fine and valiant steed to serve its master beyond the grave, but it looks to be near its end. But I have a fine eye for horses, and I dare say it will serve you one more time.");
  quest::summonitem(31496);
  quest::faction(184,10); #Knights of Truth
  quest::faction(86,-30); #Dismal Rage
  quest::faction(105,-30); #The Freeport Militia
  quest::faction(258,10); #The Priests of Marr
  quest::faction(311,10); #Steel Warriors
  quest::exp(6400);
  quest::ding();
  quest::givecash(10,6,0,0);
 }
}
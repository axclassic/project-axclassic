##Vaion 211179 Chaos Event##
sub EVENT_SIGNAL {
if($signal == 303){
quest::say("It is good to see you again mortals. I almost feared that you would not be able to complete the task and break the final seal. With the last seal broken, our master will be free once again.");
quest::say("If you would like master, I will remove these fools from your sight.");
quest::signalwith(211142,304,1000);
}
}
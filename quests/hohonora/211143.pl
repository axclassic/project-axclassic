##Juxlan, Guardian of the Second Seal Killable 211143##
sub EVENT_DEATH{
quest::depopall(211144);
quest::depopall(211145);
quest::depopall(211146);
quest::depopall(211147);
quest::depopall(211148);
quest::spawn2(211124,0,0,-792.4,1642.4,1,162.5);
quest::signalwith(211151,223,100);
}
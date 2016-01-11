sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
	}
sub EVENT_ENTER {
    quest::shout("I see you $name! Nothing but death awaits you here!");
      quest::signalwith(166963,305,0);
  }
sub EVENT_SIGNAL{
if($signal == 1500){
quest::shout("recieved signal 1500");
quest::shout("sending signal 1501");
quest::signalwith(166283,1502.0);
}
}
sub EVENT_DEATH{
quest::signalwith(166582,408,250000);
}
sub EVENT_DEATH{
quest::signalwith(166790,608,0); #Boss_Dead_Wolves
quest::signalwith(166799,15,0);
}


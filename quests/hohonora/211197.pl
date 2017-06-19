##Freeze Trigger 211197## 

my $freezeTarget=0;

sub EVENT_ENTER {
  quest::settimer("Chaosfreeze",10);
  quest::signalwith(211142,300,500);
    $freezeTarget=$client;
    $freezeTarget->Freeze();
}
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
    }
sub EVENT_TIMER {
  if($timer eq "Chaosfreeze"){
    $freezeTarget->UnFreeze();
        $freezeTarget=0;
   quest::stoptimer("Chaosfreeze");
   quest::depop();
  }
}
##Warden_Hanvar 317002 is Invul and No Target until the five adds are dead it is the fourth event encountered in the Asylum of Anguish raid expedition. He is also a bot epic mob and upon his death spawns Orb of Discordant Energy which may drop another bot epic piece.## 
sub EVENT_SPAWN {
quest::spawn2(317144,0,0,293.3,4402.7,208.6,81.4);
quest::spawn2(317146,0,0,293.3,4402.7,208.6,81.4);
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
    }
sub EVENT_ENTER {
   quest::shout("Invaders!");
   quest::spawn2(317018,0,0,388.6,4322.2,207.7,20);
   quest::spawn2(317017,0,0,381.1,4391.2,207.7,65.9);
   quest::spawn2(317016,0,0,386.7,4460.1,207.7,105.1);
   quest::spawn2(317015,0,0,465.3,4448.7,207.7,150.4);
   quest::spawn2(317017,0,0,457.7,4320.9,207.7,242.5);
   quest::spawn2(317145,0,0,439.6,4387.7,207.7,70);
   quest::depop();
}

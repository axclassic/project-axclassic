#BeginFile: barindu\Viarglug.pl
#Quest file for Barindu - Viarglug Switch: Necromancer Epic 1.5 (Soulwhisper)
sub EVENT_SPAWN{
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120);
	}
sub EVENT_ENTER {
    if(defined $qglobals{"EpicBox"} == 1) {
    quest::spawn2(283156,0,0,-49.1,-306.2,-124.1,249.6); ##Viarglug Epic level##
    quest::spawn2(283164,0,0,-60,-492.6,-124.1,250.8); ##Viarglug Timer##
    } 
	elsif(!defined $qglobals{"EpicBox"}) {
	quest::spawn2(283158,0,0,-49.1,-306.2,-124.1,249.6); ##Viarglug Normal level##
	}
} 


#EndFile: barindu\Viarglug_Switch.pl (283165)
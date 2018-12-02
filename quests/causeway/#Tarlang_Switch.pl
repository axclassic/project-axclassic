#BeginFile: causway\Tarlang_Switch.pl
#Quest file for Causeway - Tarlang_Switch: Necromancer Epic 2.0 (Deathwhisper)
sub EVENT_SPAWN{
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
	}
sub EVENT_ENTER {
    if(defined $qglobals{"EpicBox"} == 1) {
	quest::spawn2(303118,0,0,1370.4,-145.5,317.9,109.1); ##Tarlang Epic level##
	quest::depop();
    } 
	elsif(!defined $qglobals{"EpicBox"}) {
	quest::spawn2(303046,0,0,1370.4,-145.5,317.9,109.1); ##Tarlang Normal level##
	quest::depop();
	}
} 


#EndFile: causway\Tarlang_Switch.pl (303119)

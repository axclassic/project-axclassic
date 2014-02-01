#Zone: Soldunga
#Angelox: this script is to respawn a higher or lower  level NPC for trivial zone questing.
sub EVENT_SPAWN{ #Set proximity
my $x;
my $y;
my $z;
my $h;
$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$h = $npc->GetHeading();
 	quest::set_proximity( $x-100,$x+100,$y-100,$y+100,$z-100,$z+100);
}

sub EVENT_ENTER{ #PC enters and what's there depops and repops required level
	if($ulevel >= 51){
	quest::depop;	
	quest::spawn2(31146,0,0,$x,$y,$z,$h);	#This is the new High level NPC
	}
	if($ulevel <= 50){ 
	quest::depop;	
	quest::spawn2(31048,0,0,$x,$y,$z,$h);	 #This is the original npc that's in the database - Changed its respawn time to 2000 so it won't spawn double while you're there, if its for quest - if not then not needed.
	}	
}

sub EVENT_EXIT{ #have to depop when PC leaves (unless you killed him), else you get duped by the same NPC with the normal respawn.
	quest::depop();
}
## End of Trivial adjuster script.

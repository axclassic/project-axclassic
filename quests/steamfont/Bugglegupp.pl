#The best Noob Killer in EQ
#Ax_Classic
#Threeflies
#Jan 2012

sub EVENT_SPAWN

{
my $x;
my $y;
my $z;
my $h;

$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$h = $npc->GetHeading();


quest::set_proximity( $x-80,$x+80,$y-80,$y+80,$z-80,$z+80);
} 


sub EVENT_ENTER

{
quest::emote("Hahahaaa...Cleansing Steamfont of $race.");
quest::attack($name);
}


#Memories of a High Elf wizard slaughtered by this NPC at night ..........what a corpse run !
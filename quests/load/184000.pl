# Zone to Hometown
# Zone: Load
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER{
#   if (($clientver > 2) && ($ulevel == 1)){}
#Since this script doesn't always get you to your home town, 
#summon a temporary Stone of Origen 
  quest::summonitem(119512); #temporary Stone of Origen
  if ($race eq 'Wood Elf'){
  quest::rebind(54,-197,27,-0.7);
  quest::movepc(54,-197,27,-0.7);}
  elsif ($race eq 'Human'){
  quest::rebind(9,-60.9,-61.5,-24.9);
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif ($race eq 'Erudite'){
  quest::rebind(24,-309.8,109.6,23.1);
  quest::movepc(24,-309.8,109.6,23.1);}
  elsif ($race eq 'High Elf'){
  quest::rebind(61,26.3,14.9,3.1);
  quest::movepc(61,26.3,14.9,3.1);}
  elsif ($race eq 'Barbarian'){
  quest::rebind(29,12.2,-32.9,3.1);
  quest::movepc(29,12.2,-32.9,3.1);}
  elsif ($race eq 'Dark Elf'){
  quest::rebind(25,-965.3,2434.5,5.6);
  quest::movepc(25,-965.3,2434.5,5.6);}
  elsif ($race eq 'Half Elf'){
  quest::rebind(9,-60.9,-61.5,-24.9);
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif ($race eq 'Dwarf'){
  quest::rebind(68,-214.5,2940.1,0.1);
  quest::movepc(68,-214.5,2940.1,0.1);}
  elsif ($race eq 'Troll'){
  quest::rebind(52,1.1,14.5,3.1);
  quest::movepc(52,1.1,14.5,3.1);}
  elsif ($race eq 'Ogre'){
  quest::rebind(49,520.1,235.4,59.1);
  quest::movepc(49,520.1,235.4,59.1);}
  elsif ($race eq 'Halfling'){
  quest::rebind(19,-98.4,11.5,3.1);
  quest::movepc(19,-98.4,11.5,3.1);}
  elsif ($race eq 'Gnome'){
  quest::rebind(55,7.6,489.0,-24.9);
  quest::movepc(55,7.6,489.0,-24.9);}
  elsif ($race eq 'Iksar'){
  quest::rebind(106,-415.7,1276.6,3.1);
  quest::movepc(106,-415.7,1276.6,3.1);}
  elsif ($race eq 'Froglok'){
  quest::rebind(83,-1830.0,-1259.9,27.1);
  quest::movepc(83,-1830.0,-1259.9,27.1);}
  elsif ($race eq 'Vah Shir'){
  quest::rebind(74,0,0,0);
  quest::movepc(74,0,0,0);}
  }
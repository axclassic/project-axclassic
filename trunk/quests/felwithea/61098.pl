## Send SoD and up starter clients to Hometown
## Zone: Felwithea
## AngeloX
## clientver 2 Titanium
## clientver 3 SoF

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER{
 $clientver = $client->GetClientVersion();
 if (($clientver > 3) && ($ulevel == 1)){
  if ($race eq 'Wood Elf'){
  quest::movepc(54,-197,27,-0.7);}
  elsif ($race eq 'Human'){
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif ($race eq 'Erudite'){
  quest::movepc(24,-309.8,109.6,23.1);}
  ##elsif ($race eq 'High Elf'){
  ##quest::movepc(61,26.3,14.9,3.1);}
  elsif ($race eq 'Barbarian'){
  quest::movepc(29,12.2,-32.9,3.1);}
  elsif ($race eq 'Dark Elf'){
  quest::movepc(25,-965.3,2434.5,5.6);}
  elsif ($race eq 'Half Elf'){
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif ($race eq 'Dwarf'){
  quest::movepc(68,-214.5,2940.1,0.1);}
  elsif ($race eq 'Troll'){
  quest::movepc(52,1.1,14.5,3.1);}
  elsif ($race eq 'Ogre'){
  quest::movepc(49,520.1,235.4,59.1);}
  elsif ($race eq 'Halfling'){
  quest::movepc(19,-98.4,11.5,3.1);}
  elsif ($race eq 'Gnome'){
  quest::movepc(55,7.6,489.0,-24.9);}
  elsif ($race eq 'Iksar'){
  quest::movepc(106,-415.7,1276.6,3.1);}
  elsif ($race eq 'Froglok'){
  quest::movepc(83,-1830.0,-1259.9,27.1);}
  elsif ($race eq 'Vah Shir'){
  quest::movepc(74,0,0,0);}
  }
}

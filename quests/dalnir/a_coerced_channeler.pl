
#Quests covered in this file:
#Shaman Skull Quest 6
 sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
	}
sub EVENT_ENTER {
    quest::emote(' mumbles to himself');
 }
sub EVENT_DEATH
{
   quest::shout("the river of Xinth...");
}

sub EVENT_ITEM
{
   #Turn in the a potion of swirling liquid
   if(plugin::check_handin(\%itemcount, 12752 => 1)) {
      quest::summonitem(12750);#give the player on of the Iksar skulls of the sisters...
      quest::spawn2(104075,73,0,-930,250,-83,61);
	  quest::depop();
      # an npc named, Friend Vagnar the Channeler, is supposed to spawn and shout that text while running away, figure this would b easier on the server...
   }

   plugin::return_items(\%itemcount); #return items if not the ones required
}
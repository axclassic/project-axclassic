#Quests covered in this file:
#Shaman Skull Quest 7

sub EVENT_ITEM
{
   #Turn in the a dusty iksar skull
   if(plugin::check_handin(\%itemcount, 30984 => 1))
   {
      quest::emote(' runs his scaled fingers slowly over the cracked, brittle skull');
      quest::say("Granix did well to send you to me, I may yet be able to recover the spirit of this ancient and set it free. Come! I shall need your help with this ritual.");
      quest::summonitem(30984); 
	  quest::emote(' dips the skull in the crystal waters. He lifts the skull over his head and stands completely still, allowing the water to drip down off the skull down over his body and finally on to the parched sand.');
      quest::emote(' begins to chant. Quietly at first but then louder and faster. He speaks a language you only vaguely recognize. It is the voice and language of the ancient oracles. His voice booms out over the water filling your mind with images of the ancient Sebilisian empire and the great Iksar rulers of old.');
	  quest::emote(' voice stops suddenly, leaving the air completely silent. Even the waves seem to have stopped for a moment. You begin to move toward him, but he raises a hand toward you motioning for you to stay still. Suddenly without warning the skull flies from Quilins hands and flies into the murky waters. It stays submerged for a moment and then flies toward you, but this time an entire corpse is attached to it.');
	 my $x = $npc->GetX();
      my $y = $npc->GetY();
      my $z = $npc->GetZ();
      my $h = $npc->GetHeading();
      quest::spawn2(78219,0,0,$x + 5,$y,$z,$h);#spawn An Arisen Iksar
   }

   #Turn in the Wet Skull Fragments
   if(plugin::check_handin(\%itemcount, 30985 => 1)) {
      quest::say("It seems this particular ancient does not wish to be put to rest. Return this note to Hierophant Granix and tell him what happened. He will surely wish this skull to be disposed of properly, but I do not have the power to do it myself.");
      quest::summonitem(30986); #note to Hierophant Granix
   }

   else {
       plugin::return_items(\%itemcount); #return items if not the ones required
   }
}
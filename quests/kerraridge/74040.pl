#For Treant Fists quest, his real name is Clawfist, yet he is mentioned only as a banished kerra.
sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Rrrr.. Away from this isle of death and.. purr..
punishment.");
	}
if($text=~/What remains of Thipt/i){
quest::say("Clawknight Thipt wished to learn the ways of Ashen.
Prrr.. Together we go into green Goblin's lair to train.
Prrr.. We find too many and he is too weak. Separated and
unable to find him, I hear his death cry. Prrr.. I cannot make it back,
the eyes are upon me. Now I must find one sent by Ashen to
aid in the recovery of his remains - his Humerus Handled Mace,
Ribcage Chest Armor, Cat Skull Cap, and Fractured Femur.");
	}
if($text=~/Puab sent me/i){
quest::say("Show me proof.");
	}
}
# This quest combines 4 remains into a catbox and results in a box with cat bones.
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 12369 => 1)) {
quest::say("Ashen Order! Prrr.. My order! I have been
expecting one of us. Prrr.. Help me rejoin my native land.
Return the [remains of Thipt] to me. Take this box and find the 
remains of my fellow student who fell fighting goblins somewhere.");
quest::summonitem(17985);
	}
if(plugin::check_handin(\%itemcount, 12371 => 1)) {
quest::say("Prrr.. Thank you brother of Ashen. I can now spend
my time upon this island in peace, until my penance is serrrved.
He dabs his paw into the mud and places it upon a tattered parchment.
Take this message to Puab. Farrrwell.");
quest::summonitem(28055);
quest::faction(18,10);
quest::exp(100);
quest::ding();
	}
}
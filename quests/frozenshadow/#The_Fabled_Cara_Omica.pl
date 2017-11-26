# #The_Fabled_Cara_Omica NPCID - 111177
sub EVENT_SPAWN{
	$npc->SetAppearance(1); #Sitting
}
sub EVENT_DEATH{
 quest::setglobal("omica",2,3,"F"); #set global back to 2 which resets Amontehepna script
}
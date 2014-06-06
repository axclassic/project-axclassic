# Quest Name: The Fabled Coldain Ring War  #
# Based on input from Rightman and 10th coldain ring #
# Author: Resqu Miplez #
# Axclassic Rathe Server #
# test script 4.0 # 
# Test different Version Mode #
#This is a Forum version to test prior to revising for use#

sub EVENT_SAY {

$inpoka = quest::GetInstanceID("greatdivide",1);

if ($text =~/hail/i) {
	quest::say ("hi this is fifth attempt");

	if($inpoka == 0) {
		$Instance = quest::CreateInstance("greatdivide", 1, 64800);
		quest::AssignGroupToInstance($Instance);
	    	quest::say("Instance added.");
		quest::say("Your instance is: $Instance");

		quest::setglobal($name."greatdivide",$Instance,7,"H18");
		quest::setglobal($name."zone",$Instance,7,"H18");
		quest::MovePCInstance(118, $Instance, -965,-7720,-557);
		quest::say("I'd move you, but Cy has it commented out currently.");

	} else {
		$client->Message(13, "You are already in an instance, the ID which is $inpoka");
		quest::say("If you wish to [return] to this instance, just say so!");
	}

}
if ($text =~/return/i) {
		quest::MovePCInstance(118, $inpoka, -965,-7720,-557);
	}
if ($text =~/clearme/i) {
		quest::DestroyInstance($Instance);
		quest::delglobal($name."greatdivide");
		quest::delglobal($name."zone");
		$inpoka = 0;
		quest::say("Clearing your instance stuff");
	}
}

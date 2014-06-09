# Quest Name: The Fabled Coldain Ring War  #
# Based on input from Rightman and 10th coldain ring #
# Author: Resqu Miplez #
# Axclassic Rathe Server #
# test script 5.6 # 
# STILL would not send partner to same instance #
# Would not take weapons #


sub EVENT_SAY{
my $join = quest::saylink("join", 1);
my $begin = quest::saylink("begin",1);
my $return = quest::saylink("return",1);
$inpoka = quest::GetInstanceID($name."greatdivide",1);

if($text =~ /clearme/i){
	quest::delglobal($name."greatdivide");
	quest::DestroyInstance($inpoka);
	quest::say("Clearing your instance stuff");
}
if($text =~ /hail/i && $inpoka == 0){
	$client->Message(14,"Greetings This is Test SIX. The giants have put together a vast army to attack Thurgadin. This may be the most difficult battle in the history of Velious. Can you come to our aid? Show me proof that you have killed Giants before by giving me three Giant Warrior Helmets and a Velium Weapon and I will enlist you and whoever you bring to fight them. If you return you may bring friends along to aid Thurgadin");
}
if ($text=~/hail/i && $inpoka != 0) {
    $client->Message(13, "You are already in Great Divide ($inpoka)");
    $client->Message(14,"Your friends are in battle for Thurgadin. Are you ready to $begin?");
}

if ($text =~/begin/i) {
	quest::say ("You May finally begin to prove yourself a hero.");

	if($inpoka == 0) {
		$Instance = quest::CreateInstance("greatdivide", 1, 64800);
		quest::AssignGroupToInstance($Instance);
	    	quest::say("Instance added.");
		quest::say("Your instance is: $Instance");

		quest::setglobal($name."greatdivide",$Instance,7,"H18");
		quest::setglobal($name."zone",$Instance,7,"H18");
		quest::MovePCInstance(118, $Instance, -965,-7720,-557);
		quest::say("ON WORDS TO WAR!");

	} else {
		$client->Message(13, "You are already in a War, the ID which is $inpoka");
		$client->Message(13,"If you wish to $return to this instance, just say so!");
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
}


sub EVENT_ITEM{

if(($itemcount{29062} == 3) && ($itemcount{30200} == 1)){
   quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30201} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30202} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30203} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30204} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30205} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30206} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30207} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30208} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }
elsif(($itemcount{29062} == 3) && ($itemcount{30209} == 1)){
    quest::say("Congratulations! You have proven yourself are you ready to $begin?");
  }

else {
	$client->Message(13,"I don't need this."); #text made up
   	plugin::return_items(\%itemcount);
   	return 1;
	}
}


# Quest Name: The Fabled Coldain Ring War  #
# Based on input from Rightman and 10th coldain ring #
# Author: Resqu Miplez #
# Axclassic Rathe Server #
# test script 5.0 # 

sub EVENT_SAY{
my $join = quest::saylink("join", 1);

$inpoka = quest::GetInstanceID($name."greatdivide",1);

if($text =~ /clearme/i){
	quest::delglobal($name."greatdivide");
	quest::DestroyInstance($inpoka);
	quest::say("Clearing your instance stuff");
}
elsif($text =~ /hail/i && $inpoka == 0){
	$client->Message(14,"Greetings This is Test ONE. The giants have put together a vast army to attack Thurgadin. This may be the most difficult battle in the history of Velious. Can you come to our aid? Show me proof that you have killed Giants before by giving me three Giant Warrior Helmets and a Velium Weapon and I will enlist you and whoever you bring to fight them. If you return you may bring friends along to aid Thurgadin");
}
elsif ($text=~/hail/i && $inpoka > 0) {
    $client->Message(13, "You are already in Great Divide ($inpoka)");
    $client->Message(14,"Your friends are in battle for Thurgadin. Are you willing to $join?");
}
elsif ($text=~/join/i) {
    quest::MovePCInstance(118, $inpoka, -965,-7720,-557);
}
}


sub EVENT_ITEM{
$inpoka = quest::GetInstanceID("greatdivide",1);

if((plugin::check_handin(\%itemcount, 29062 => 3, 30200 => 1)) ||#Velium Long Sword 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30201 => 1)) ||#Velium Two Handed Sword 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30202 => 1)) ||#Velium Short Sword 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30203 => 1)) ||#Velium Scimitar 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30204 => 1)) ||# Velium Warhammer 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30205 => 1)) ||# Velium Morning Star 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30206 => 1)) ||# Velium Great Staff 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30207 => 1)) ||#Velium Dagger 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30208 => 1)) ||#Velium Spear
         (plugin::check_handin(\%itemcount, 29062 => 3, 30209 => 1)))# Velium Rapier
      {


  if($inpoka == 0) {
		$Instance = quest::CreateInstance("greatdivide", 1, 64800);
		quest::AssignGroupToInstance($Instance);
	    	quest::say("Instance added.");
		quest::say("Your instance is: $Instance");

		quest::setglobal($name."greatdivide",$Instance,7,"H18");
		quest::setglobal($name."zone",$Instance,7,"H18");
		quest::MovePCInstance(118, $Instance, -965,-7720,-557);
		$client->Message(14,"Thank you $name , you are on the way to fight the war in Great Divide ($inpoka), good luck!"); #Instance creation and porting to it.

	} else {
		$client->Message(13, "You are already in an instance, the ID which is $inpoka");
		quest::say("If you wish to $join to this instance, just say so!");
	}
}
}

